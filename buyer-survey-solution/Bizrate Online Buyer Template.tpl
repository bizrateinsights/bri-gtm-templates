﻿___INFO___

{
  "displayName": "Bizrate Online Buyer Template",
  "categories": ["Survey"],
  "description": "Template to use while waiting for the Vendor Template to be updated.",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "displayName": "",
    "id": "brand_dummy"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "mid",
    "displayName": "MID",
    "simpleValueType": true,
    "valueHint": "Enter your MID here",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "RADIO",
    "name": "surveyType",
    "displayName": "",
    "radioItems": [
      {
        "value": "pos",
        "displayValue": "Point of Sale"
      },
      {
        "value": "multi",
        "displayValue": "Site Abandonment"
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "orderId",
    "displayName": "Order ID",
    "simpleValueType": true,
    "canBeEmptyString": true
  },
  {
    "type": "GROUP",
    "name": "customerIdentification",
    "displayName": "Customer Identification",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "customerId",
        "displayName": "Customer ID",
        "simpleValueType": true,
        "canBeEmptyString": true
      },
      {
        "type": "TEXT",
        "name": "zip",
        "displayName": "Zip Code",
        "simpleValueType": true,
        "canBeEmptyString": true
      },
      {
        "type": "TEXT",
        "name": "webAnalyticsId",
        "displayName": "Web Analytics ID",
        "simpleValueType": true,
        "canBeEmptyString": true
      },
      {
        "type": "TEXT",
        "name": "emailAddress",
        "displayName": "Email Address",
        "simpleValueType": true,
        "canBeEmptyString": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "productIdentification",
    "displayName": "Product Identification",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "gtin",
        "displayName": "UPC/EAN",
        "simpleValueType": true,
        "canBeEmptyString": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "referringPage",
    "displayName": "Referring Page",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "referrerPage",
        "displayName": "Referrer Page",
        "simpleValueType": true,
        "canBeEmptyString": true
      },
      {
        "type": "TEXT",
        "name": "referrerUrl",
        "displayName": "Referrer URL",
        "simpleValueType": true,
        "canBeEmptyString": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "coupons",
    "displayName": "Coupons",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "couponApplied",
        "displayName": "Coupon Applied",
        "simpleValueType": true,
        "canBeEmptyString": true,
        "valueHint": "True, false, or leave empty"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "pageTypeIdentifier",
    "displayName": "Page Type Identifiers",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "pageId",
        "displayName": "Page ID",
        "simpleValueType": true,
        "canBeEmptyString": true
      },
      {
        "type": "TEXT",
        "name": "segment",
        "displayName": "Segment",
        "simpleValueType": true,
        "canBeEmptyString": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "shoppingCartProducts",
    "displayName": "Shopping Cart Products",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "cart",
        "displayName": "Cart",
        "simpleValueType": true,
        "canBeEmptyString": true
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "customValues",
    "displayName": "Custom Values",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "customVal1",
        "displayName": "Custom Value 1",
        "simpleValueType": true,
        "canBeEmptyString": true
      },
      {
        "type": "TEXT",
        "name": "customVal2",
        "displayName": "Custom Value 2",
        "simpleValueType": true,
        "canBeEmptyString": true
      },
      {
        "type": "TEXT",
        "name": "customVal3",
        "displayName": "Custom Value 3",
        "simpleValueType": true,
        "canBeEmptyString": true
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

var log = require('logToConsole');
var injectScript = require('injectScript');
var setInWindow = require('setInWindow');
const queryPermission = require('queryPermission');

var _cnx = _cnx || [];
const initScriptUrl = 'https://insights.bizrate.com/js/init.js';

_cnx.push(['mid', data.mid]); 
_cnx.push(['surveyType', data.surveyType]);
_cnx.push(['orderId', data.orderId]); 
_cnx.push(['customerId', data.emailAddress]); 
_cnx.push(['zip', data.zip]); 
_cnx.push(['webAnalyticsId', data.webAnalyticsId]);
_cnx.push(['gtin', data.gtin]); 
_cnx.push(['referrerPage', data.referrerPage]); 
_cnx.push(['referrerUrl', data.referrerUrl]); 
_cnx.push(['couponApplied', data.couponApplied]);
_cnx.push(['pageId', data.pageId]); 
_cnx.push(['segment', data.segment]);
_cnx.push(['cart', data.cart]); 
_cnx.push(['customVal1', data.customVal1]);
_cnx.push(['customVal2', data.customVal2]); 
_cnx.push(['customVal3', data.customVal3]); 

setInWindow('_cnx', _cnx, true);

const onSuccess = () => {
  log('Script loaded successfully!');
  data.gtmOnSuccess();
};

const onFailure = () => {
  log('Script failed to load');
  data.gtmOnFailure();
};

injectScript(initScriptUrl, onSuccess, onFailure, 'bizrate');


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://insights.bizrate.com/js/init.js"
              },
              {
                "type": 1,
                "string": "https://resource.bizrate.com/static/3eb3faf3/dist/main.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_cnx"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "SIP"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "_test"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 3/30/2021, 5:28:37 PM


