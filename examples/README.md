# Examples

The `ballerinax/interzoid.currencyrate` connector provides practical examples illustrating usage in various scenarios.

1. [Currency rate lookup](./currency_rate_lookup/currency_rate_lookup.md) - Look up the live exchange rate for a single currency.
2. [Multi-currency rate report](./multi_currency_rate_report/multi_currency_rate_report.md) - Build a rate report for several currencies.

## Prerequisites

Obtain an Interzoid API license key by registering at [Interzoid](https://www.interzoid.com/register-api-account), and push the connector to the local repository with `bal pack && bal push --repository=local`.

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
