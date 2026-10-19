import ballerina/io;
import ballerinax/interzoid.currencyrate;

configurable string licenseKey = ?;
configurable string currencySymbol = "EUR";

// Looks up the live exchange rate for one currency and reports whether the call succeeded.
public function main() returns error? {
    currencyrate:Client interzoid = check new ({license: licenseKey});

    currencyrate:CurrencyRate rate = check interzoid->getCurrencyRate(symbol = currencySymbol);

    string code = rate.code ?: "";
    if code != "Success" {
        return error("Currency rate lookup failed with code: " + code);
    }
    io:println(string `${rate.symbol ?: currencySymbol} (${rate.name ?: "unknown"}, ${rate.country ?: "unknown"}): ${rate.rate ?: "n/a"}`);
    io:println("Remaining credits: ", rate.credits ?: 0);
}
