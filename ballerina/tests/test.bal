// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/os;
import ballerina/test;

final boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
final string serviceUrl = isLiveServer ? "https://api.interzoid.com" : "http://localhost:9090";
final string licenseKey = isLiveServer ? os:getEnv("INTERZOID_LICENSE") : "test_license";

final Client interzoid = check new ({license: licenseKey}, {httpVersion: http:HTTP_1_1}, serviceUrl);

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetCurrencyRate() returns error? {
    CurrencyRate response = check interzoid->getCurrencyRate(symbol = "EUR");
    test:assertEquals(response?.symbol, "EUR");
    test:assertTrue(response?.rate !is ());
    if !isLiveServer {
        test:assertEquals(response?.rate, "0.872");
    }
}
