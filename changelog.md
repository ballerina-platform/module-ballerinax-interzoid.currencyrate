# Changelog

All notable changes to this project are documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- The `GetCurrencyRateQueries` record, which carries the query parameters of `getCurrencyRate`.
- An optional `headers` parameter on the remote method, for sending extra request headers.
- New `ConnectionConfig` fields, taken from `http:ClientConfiguration`: `followRedirects`, `cookieConfig`, `socketConfig` and `laxDataBinding`.
- Documentation for the fields of `CurrencyRate`.

### Changed

- **Breaking:** `getCurrencyRate` takes `symbol` as a named argument (or a `GetCurrencyRateQueries` record) after `headers`, rather than as its first positional argument: `getCurrencyRate("EUR")` is now `getCurrencyRate(symbol = "EUR")`.
- **Breaking:** the `CurrencyInfo` record, returned by `getCurrencyRate`, is renamed to `CurrencyRate`.
- **Breaking:** record fields use camel case, mapped to the API's Pascal-case JSON names with `@jsondata:Name`. For example, `CurrencyInfo.Rate` is now `CurrencyRate.rate`.
- **Breaking:** `CurrencyRate.credits` is an `int` (was `string`).
- **Breaking:** `ConnectionConfig.http1Settings` is now `http:ClientHttp1Settings` (was the connector's own `ClientHttp1Settings`).
- `ConnectionConfig.timeout` defaults to 30 seconds (was 60).

### Removed

- **Breaking:** the connector's own `ClientHttp1Settings` and `ProxyConfig` records. Use `http:ClientHttp1Settings` and `http:ProxyConfig` instead.
