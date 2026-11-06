# Multi-Currency Rate Report

Builds an exchange rate report for a configurable list of currencies, calling the Interzoid API once per symbol. It stops early if the license runs out of credits.

## Prerequisites

- Ballerina Swan Lake 2201.12.0 or later

- Create a `Config.toml` in this directory:
  ```toml
  licenseKey = "<Interzoid API license key>"
  currencySymbols = "EUR,GBP,JPY"
  ```

## Run the example

```bash
bal run
```
