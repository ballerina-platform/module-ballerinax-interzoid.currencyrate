_Author_:  @DimuthuMadushan \
_Created_: 2026/10/19 \
_Updated_: 2026/10/19 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from Interzoid Currency Rate.
The OpenAPI specification is obtained from [Interzoid Currency Rate OpenAPI specification](https://github.com/wso2/api-specs/blob/main/openapi/interzoid/currencyrate/1.0.0/openapi.json).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. The `openapi` version was changed from `3.1.0` to `3.0.3` in the original spec (`docs/spec/openapi.json`). The Ballerina OpenAPI flatten and align tools drop the `type` of every schema and parameter in a 3.1.0 document, which generates `anydata` fields and parameters in the client.
2. The operation-level `license` query parameter was removed from `getCurrencyRate` in the original spec (`docs/spec/openapi.json`). The `apiKeyAuth` security scheme already sends the configured license in the same query parameter, so the generated client overwrote whatever the caller passed.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/aligned_ballerina_openapi.json --mode client --client-methods remote --license docs/license.txt -o ballerina
```

Note: The license year is hardcoded to 2026, change if necessary.
