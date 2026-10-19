## Overview

The Interzoid Currency Rate connector lets Ballerina applications retrieve live currency exchange rates from the [Interzoid Live Currency Exchange Rates API](https://www.interzoid.com/apis/live-currency-exchange-rates). It supports version 1.0.0 of the API, which returns the name, country, current rate and remaining API credits for a given currency symbol.

### Key features

- Retrieve the live exchange rate for a currency symbol such as `EUR` or `USD`
- Get the currency name and the country or region it is associated with
- Check the remaining credits on your Interzoid API license with every call

## Setup guide

To use the connector, you need an Interzoid API license key.

1. Register for an account at [Interzoid](https://www.interzoid.com/register-api-account).

2. Copy the API license key issued for your account. The connector sends it in the `license` query parameter.

## Quickstart

To use the Interzoid Currency Rate connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

```ballerina
import ballerinax/interzoid.currencyrate;
```

### Step 2: Create a `Config.toml` file

```toml
licenseKey = "<Interzoid API license key>"
```

### Step 3: Create a client

```ballerina
configurable string licenseKey = ?;

final currencyrate:Client interzoid = check new ({license: licenseKey});
```

### Step 4: Invoke an operation

```ballerina
public function main() returns error? {
    currencyrate:CurrencyRate _ = check interzoid->getCurrencyRate(license = licenseKey, symbol = "EUR");
}
```

## Examples

The `Interzoid Currency Rate` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-interzoid.currencyrate/tree/main/examples/), covering the following use cases:

1. [Currency rate lookup](https://github.com/ballerina-platform/module-ballerinax-interzoid.currencyrate/tree/main/examples/currency_rate_lookup) - Look up the live exchange rate for a single currency and check the call succeeded.
2. [Multi-currency rate report](https://github.com/ballerina-platform/module-ballerinax-interzoid.currencyrate/tree/main/examples/multi_currency_rate_report) - Build a rate report for a list of currencies, stopping early if the API credits run out.
