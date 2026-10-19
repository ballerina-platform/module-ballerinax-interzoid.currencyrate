import ballerina/io;
import ballerina/lang.regexp;
import ballerinax/interzoid.currencyrate;

configurable string licenseKey = ?;
configurable string currencySymbols = ?;

// Builds a rate report for a comma-separated list of currencies, stopping if the API credits run out.
public function main() returns error? {
    currencyrate:Client interzoid = check new ({license: licenseKey});

    map<string> report = {};
    foreach string entry in regexp:split(re `,`, currencySymbols) {
        string symbol = entry.trim();
        if symbol == "" {
            continue;
        }
        currencyrate:CurrencyRate rate = check interzoid->getCurrencyRate(symbol = symbol);
        string? value = rate.rate;
        if value is () {
            return error("No rate returned for " + symbol);
        }
        report[symbol] = value;
        int? credits = rate.credits;
        if credits is int && credits <= 0 {
            io:println("API credits exhausted, stopping early.");
            break;
        }
    }
    foreach var [symbol, value] in report.entries() {
        io:println(string `${symbol}: ${value}`);
    }
}
