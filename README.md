# Ballerina Interzoid Currency Rate connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-interzoid.currencyrate/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-interzoid.currencyrate/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-interzoid.currencyrate.svg)](https://github.com/ballerina-platform/module-ballerinax-interzoid.currencyrate/commits/master)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/interzoid.currencyrate.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%interzoid.currencyrate)

## Overview

The Interzoid Currency Rate connector lets Ballerina applications retrieve live currency exchange rates from the [Interzoid Live Currency Exchange Rates API](https://www.interzoid.com/apis/live-currency-exchange-rates). It supports version 1.0.0 of the API, which returns the name, country, current rate and remaining API credits for a given currency symbol.

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
    currencyrate:CurrencyRate _ = check interzoid->getCurrencyRate(symbol = "EUR");
}
```

## Examples

The `Interzoid Currency Rate` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-interzoid.currencyrate/tree/main/examples/), covering the following use cases:

1. [Currency rate lookup](https://github.com/ballerina-platform/module-ballerinax-interzoid.currencyrate/tree/main/examples/currency_rate_lookup) - Look up the live exchange rate for a single currency and check the call succeeded.
2. [Multi-currency rate report](https://github.com/ballerina-platform/module-ballerinax-interzoid.currencyrate/tree/main/examples/multi_currency_rate_report) - Build a rate report for a list of currencies, stopping early if the API credits run out.

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`interzoid.currencyrate` package](https://central.ballerina.io/ballerinax/interzoid.currencyrate/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
