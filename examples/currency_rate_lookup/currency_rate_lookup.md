# Currency Rate Lookup

Looks up the live exchange rate for one currency through the Interzoid API and verifies that the call succeeded. It prints the currency name, country, rate and the credits remaining on the license.

## Prerequisites

- Ballerina Swan Lake 2201.12.0 or later

- Create a `Config.toml` in this directory:
  ```toml
  licenseKey = "<Interzoid API license key>"
  currencySymbol = "EUR"
  ```

## Run the example

```bash
bal run
```
