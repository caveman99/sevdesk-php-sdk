# Itsmind\Sevdesk\InvoiceApi

All URIs are relative to https://my.sevdesk.de/api/v1, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**bookInvoice()**](InvoiceApi.md#bookInvoice) | **PUT** /Invoice/{invoiceId}/bookAmount | Book an invoice |
| [**cancelInvoice()**](InvoiceApi.md#cancelInvoice) | **POST** /Invoice/{invoiceId}/cancelInvoice | Cancel an invoice / Create cancellation invoice |
| [**createInvoiceByFactory()**](InvoiceApi.md#createInvoiceByFactory) | **POST** /Invoice/Factory/saveInvoice | Create a new invoice |
| [**createInvoiceFromOrder()**](InvoiceApi.md#createInvoiceFromOrder) | **POST** /Invoice/Factory/createInvoiceFromOrder | Create invoice from order |
| [**createInvoiceReminder()**](InvoiceApi.md#createInvoiceReminder) | **POST** /Invoice/Factory/createInvoiceReminder | Create invoice reminder |
| [**getInvoiceById()**](InvoiceApi.md#getInvoiceById) | **GET** /Invoice/{invoiceId} | Find invoice by ID |
| [**getInvoicePositionsById()**](InvoiceApi.md#getInvoicePositionsById) | **GET** /Invoice/{invoiceId}/getPositions | Find invoice positions |
| [**getInvoices()**](InvoiceApi.md#getInvoices) | **GET** /Invoice | Retrieve invoices |
| [**getIsInvoicePartiallyPaid()**](InvoiceApi.md#getIsInvoicePartiallyPaid) | **GET** /Invoice/{invoiceId}/getIsPartiallyPaid | Check if an invoice is already partially paid |
| [**invoiceGetPdf()**](InvoiceApi.md#invoiceGetPdf) | **GET** /Invoice/{invoiceId}/getPdf | Retrieve pdf document of an invoice |
| [**invoiceRender()**](InvoiceApi.md#invoiceRender) | **POST** /Invoice/{invoiceId}/render | Render the pdf document of an invoice |
| [**invoiceSendBy()**](InvoiceApi.md#invoiceSendBy) | **PUT** /Invoice/{invoiceId}/sendBy | Mark invoice as sent |
| [**sendInvoiceViaEMail()**](InvoiceApi.md#sendInvoiceViaEMail) | **POST** /Invoice/{invoiceId}/sendViaEmail | Send invoice via email |


## `bookInvoice()`

```php
bookInvoice($invoice_id, $book_invoice_request): \Itsmind\Sevdesk\Model\BookInvoice200Response
```

Book an invoice

Booking the invoice with a transaction is probably the most important part in the bookkeeping process.<br> There are several ways on correctly booking an invoice, all by using the same endpoint.<br> for more information look <a href='https://api.sevdesk.de/#section/How-to-book-an-invoice'>here</a>.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure API key authorization: api_key
$config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
// $config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'Bearer');


$apiInstance = new Itsmind\Sevdesk\Api\InvoiceApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$invoice_id = 56; // int | ID of invoice to book
$book_invoice_request = new \Itsmind\Sevdesk\Model\BookInvoiceRequest(); // \Itsmind\Sevdesk\Model\BookInvoiceRequest | Booking data

try {
    $result = $apiInstance->bookInvoice($invoice_id, $book_invoice_request);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InvoiceApi->bookInvoice: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **invoice_id** | **int**| ID of invoice to book | |
| **book_invoice_request** | [**\Itsmind\Sevdesk\Model\BookInvoiceRequest**](../Model/BookInvoiceRequest.md)| Booking data | [optional] |

### Return type

[**\Itsmind\Sevdesk\Model\BookInvoice200Response**](../Model/BookInvoice200Response.md)

### Authorization

[api_key](../../README.md#api_key)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `cancelInvoice()`

```php
cancelInvoice($invoice_id): \Itsmind\Sevdesk\Model\GetInvoiceById200Response
```

Cancel an invoice / Create cancellation invoice

This endpoint will cancel the specified invoice therefor creating a cancellation invoice.<br>       The cancellation invoice will be automatically paid and the source invoices status will change to 'cancelled'.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure API key authorization: api_key
$config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
// $config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'Bearer');


$apiInstance = new Itsmind\Sevdesk\Api\InvoiceApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$invoice_id = 56; // int | ID of invoice to be cancelled

try {
    $result = $apiInstance->cancelInvoice($invoice_id);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InvoiceApi->cancelInvoice: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **invoice_id** | **int**| ID of invoice to be cancelled | |

### Return type

[**\Itsmind\Sevdesk\Model\GetInvoiceById200Response**](../Model/GetInvoiceById200Response.md)

### Authorization

[api_key](../../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `createInvoiceByFactory()`

```php
createInvoiceByFactory($save_invoice): \Itsmind\Sevdesk\Model\SaveInvoiceResponse
```

Create a new invoice

This endpoint offers you the following functionality.       <ul>          <li>Create invoices together with positions and discounts</li>          <li>Delete positions while adding new ones</li>          <li>Delete or add discounts, or both at the same time</li>          <li>Automatically fill the address of the supplied contact into the invoice address</li>       </ul>       To make your own request sample slimmer, you can omit all parameters which are not required and nullable.       However, for a valid and logical bookkeeping document, you will also need some of them to ensure that all the necessary data is in the invoice.<br><br> The list of parameters starts with the invoice array.<br> This array contains all required attributes for a complete invoice.<br> Most of the attributes are covered in the invoice attribute list, there are only two parameters standing out, namely <b>mapAll</b> and <b>objectName</b>.<br> These are just needed for our system and you always need to provide them.<br><br> The list of parameters then continues with the invoice position array.<br> With this array you have the possibility to add multiple positions at once.<br> In the example it only contains one position, again together with the parameters <b>mapAll</b> and <b>objectName</b>, however, you can add more invoice positions by extending the array.<br> So if you wanted to add another position, you would add the same list of parameters with an incremented array index of \"1\" instead of \"0\".<br><br> The list ends with the four parameters invoicePosDelete, discountSave, discountDelete and takeDefaultAddress.<br> They only play a minor role if you only want to create an invoice but we will shortly explain what they can do.<br> With invoicePosDelete you have to option to delete invoice positions as this request can also be used to update invoices.<br> With discountSave you can add discounts to your invoice.<br> With discountDelete you can delete discounts from your invoice.<br> With takeDefaultAddress you can specify that the first address of the contact you are using for the invoice is taken for the invoice address attribute automatically, so you don't need to provide the address yourself.<br> If you want to know more about these parameters, for example if you want to use this request to update invoices, feel free to contact our support.<br><br> Finally, after covering all parameters, they only important information left, is that the order of the last four attributes always needs to be kept.<br> You will also always need to provide all of them, as otherwise the request won't work properly.<br><br> <b>Warning\":\"</b> You can not create a regular invoice with the <b>deliveryDate</b> being later than the <b>invoiceDate</b>.<br> To do that you will need to create a so called <b>Abschlagsrechnung</b> by setting the <b>invoiceType</b> parameter to <b>AR</b>.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure API key authorization: api_key
$config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
// $config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'Bearer');


$apiInstance = new Itsmind\Sevdesk\Api\InvoiceApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$save_invoice = new \Itsmind\Sevdesk\Model\SaveInvoice(); // \Itsmind\Sevdesk\Model\SaveInvoice | Creation data. Please be aware, that you need to provide at least all required parameter      of the invoice model!

try {
    $result = $apiInstance->createInvoiceByFactory($save_invoice);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InvoiceApi->createInvoiceByFactory: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **save_invoice** | [**\Itsmind\Sevdesk\Model\SaveInvoice**](../Model/SaveInvoice.md)| Creation data. Please be aware, that you need to provide at least all required parameter      of the invoice model! | [optional] |

### Return type

[**\Itsmind\Sevdesk\Model\SaveInvoiceResponse**](../Model/SaveInvoiceResponse.md)

### Authorization

[api_key](../../README.md#api_key)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `createInvoiceFromOrder()`

```php
createInvoiceFromOrder($invoice_id, $invoice_object_name, $model_create_invoice_from_order): \Itsmind\Sevdesk\Model\GetInvoiceById200Response
```

Create invoice from order

Create an invoice from an order

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure API key authorization: api_key
$config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
// $config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'Bearer');


$apiInstance = new Itsmind\Sevdesk\Api\InvoiceApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$invoice_id = 56; // int | the id of the invoice
$invoice_object_name = Invoice; // string | Model name, which is 'Invoice'
$model_create_invoice_from_order = new \Itsmind\Sevdesk\Model\ModelCreateInvoiceFromOrder(); // \Itsmind\Sevdesk\Model\ModelCreateInvoiceFromOrder | Create invoice

try {
    $result = $apiInstance->createInvoiceFromOrder($invoice_id, $invoice_object_name, $model_create_invoice_from_order);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InvoiceApi->createInvoiceFromOrder: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **invoice_id** | **int**| the id of the invoice | |
| **invoice_object_name** | **string**| Model name, which is &#39;Invoice&#39; | |
| **model_create_invoice_from_order** | [**\Itsmind\Sevdesk\Model\ModelCreateInvoiceFromOrder**](../Model/ModelCreateInvoiceFromOrder.md)| Create invoice | [optional] |

### Return type

[**\Itsmind\Sevdesk\Model\GetInvoiceById200Response**](../Model/GetInvoiceById200Response.md)

### Authorization

[api_key](../../README.md#api_key)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `createInvoiceReminder()`

```php
createInvoiceReminder($invoice_id, $invoice_object_name, $create_invoice_reminder_request): \Itsmind\Sevdesk\Model\GetInvoiceById200Response
```

Create invoice reminder

Create an reminder from an invoice

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure API key authorization: api_key
$config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
// $config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'Bearer');


$apiInstance = new Itsmind\Sevdesk\Api\InvoiceApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$invoice_id = 56; // int | the id of the invoice
$invoice_object_name = Invoice; // string | Model name, which is 'Invoice'
$create_invoice_reminder_request = new \Itsmind\Sevdesk\Model\CreateInvoiceReminderRequest(); // \Itsmind\Sevdesk\Model\CreateInvoiceReminderRequest | Create invoice

try {
    $result = $apiInstance->createInvoiceReminder($invoice_id, $invoice_object_name, $create_invoice_reminder_request);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InvoiceApi->createInvoiceReminder: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **invoice_id** | **int**| the id of the invoice | |
| **invoice_object_name** | **string**| Model name, which is &#39;Invoice&#39; | |
| **create_invoice_reminder_request** | [**\Itsmind\Sevdesk\Model\CreateInvoiceReminderRequest**](../Model/CreateInvoiceReminderRequest.md)| Create invoice | [optional] |

### Return type

[**\Itsmind\Sevdesk\Model\GetInvoiceById200Response**](../Model/GetInvoiceById200Response.md)

### Authorization

[api_key](../../README.md#api_key)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `getInvoiceById()`

```php
getInvoiceById($invoice_id): \Itsmind\Sevdesk\Model\GetInvoiceById200Response
```

Find invoice by ID

Returns a single invoice

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure API key authorization: api_key
$config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
// $config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'Bearer');


$apiInstance = new Itsmind\Sevdesk\Api\InvoiceApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$invoice_id = 56; // int | ID of invoice to return

try {
    $result = $apiInstance->getInvoiceById($invoice_id);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InvoiceApi->getInvoiceById: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **invoice_id** | **int**| ID of invoice to return | |

### Return type

[**\Itsmind\Sevdesk\Model\GetInvoiceById200Response**](../Model/GetInvoiceById200Response.md)

### Authorization

[api_key](../../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `getInvoicePositionsById()`

```php
getInvoicePositionsById($invoice_id, $limit, $offset, $embed): \Itsmind\Sevdesk\Model\GetInvoicePos200Response
```

Find invoice positions

Returns all positions of an invoice

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure API key authorization: api_key
$config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
// $config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'Bearer');


$apiInstance = new Itsmind\Sevdesk\Api\InvoiceApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$invoice_id = 56; // int | ID of invoice to return the positions
$limit = 56; // int | limits the number of entries returned
$offset = 56; // int | set the index where the returned entries start
$embed = array('embed_example'); // string[] | Get some additional information. Embed can handle multiple values, they must be separated by comma.

try {
    $result = $apiInstance->getInvoicePositionsById($invoice_id, $limit, $offset, $embed);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InvoiceApi->getInvoicePositionsById: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **invoice_id** | **int**| ID of invoice to return the positions | |
| **limit** | **int**| limits the number of entries returned | [optional] |
| **offset** | **int**| set the index where the returned entries start | [optional] |
| **embed** | [**string[]**](../Model/string.md)| Get some additional information. Embed can handle multiple values, they must be separated by comma. | [optional] |

### Return type

[**\Itsmind\Sevdesk\Model\GetInvoicePos200Response**](../Model/GetInvoicePos200Response.md)

### Authorization

[api_key](../../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `getInvoices()`

```php
getInvoices($status, $invoice_number, $start_date, $end_date, $contact_id, $contact_object_name): \Itsmind\Sevdesk\Model\GetInvoiceById200Response
```

Retrieve invoices

There are a multitude of parameter which can be used to filter. A few of them are attached but       for a complete list please check out <a href='https://api.sevdesk.de/#section/How-to-filter-for-certain-invoices'>this</a> list

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure API key authorization: api_key
$config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
// $config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'Bearer');


$apiInstance = new Itsmind\Sevdesk\Api\InvoiceApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$status = 3.4; // float | Status of the invoices
$invoice_number = 'invoice_number_example'; // string | Retrieve all invoices with this invoice number
$start_date = 56; // int | Retrieve all invoices with a date equal or higher
$end_date = 56; // int | Retrieve all invoices with a date equal or lower
$contact_id = 56; // int | Retrieve all invoices with this contact. Must be provided with contact[objectName]
$contact_object_name = 'contact_object_name_example'; // string | Only required if contact[id] was provided. 'Contact' should be used as value.

try {
    $result = $apiInstance->getInvoices($status, $invoice_number, $start_date, $end_date, $contact_id, $contact_object_name);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InvoiceApi->getInvoices: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **status** | **float**| Status of the invoices | [optional] |
| **invoice_number** | **string**| Retrieve all invoices with this invoice number | [optional] |
| **start_date** | **int**| Retrieve all invoices with a date equal or higher | [optional] |
| **end_date** | **int**| Retrieve all invoices with a date equal or lower | [optional] |
| **contact_id** | **int**| Retrieve all invoices with this contact. Must be provided with contact[objectName] | [optional] |
| **contact_object_name** | **string**| Only required if contact[id] was provided. &#39;Contact&#39; should be used as value. | [optional] |

### Return type

[**\Itsmind\Sevdesk\Model\GetInvoiceById200Response**](../Model/GetInvoiceById200Response.md)

### Authorization

[api_key](../../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `getIsInvoicePartiallyPaid()`

```php
getIsInvoicePartiallyPaid($invoice_id): \Itsmind\Sevdesk\Model\GetIsInvoicePartiallyPaid200Response
```

Check if an invoice is already partially paid

Returns 'true' if the given invoice is partially paid - 'false' if it is not.      Invoices which are completely paid are regarded as not partially paid.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure API key authorization: api_key
$config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
// $config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'Bearer');


$apiInstance = new Itsmind\Sevdesk\Api\InvoiceApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$invoice_id = 56; // int | ID of invoice to return

try {
    $result = $apiInstance->getIsInvoicePartiallyPaid($invoice_id);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InvoiceApi->getIsInvoicePartiallyPaid: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **invoice_id** | **int**| ID of invoice to return | |

### Return type

[**\Itsmind\Sevdesk\Model\GetIsInvoicePartiallyPaid200Response**](../Model/GetIsInvoicePartiallyPaid200Response.md)

### Authorization

[api_key](../../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `invoiceGetPdf()`

```php
invoiceGetPdf($invoice_id, $download, $prevent_send_by): \Itsmind\Sevdesk\Model\InvoiceGetPdf200Response
```

Retrieve pdf document of an invoice

Retrieves the pdf document of an invoice with additional metadata.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure API key authorization: api_key
$config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
// $config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'Bearer');


$apiInstance = new Itsmind\Sevdesk\Api\InvoiceApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$invoice_id = 56; // int | ID of invoice from which you want the pdf
$download = true; // bool | If u want to download the pdf of the invoice.
$prevent_send_by = true; // bool | Defines if u want to send the invoice.

try {
    $result = $apiInstance->invoiceGetPdf($invoice_id, $download, $prevent_send_by);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InvoiceApi->invoiceGetPdf: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **invoice_id** | **int**| ID of invoice from which you want the pdf | |
| **download** | **bool**| If u want to download the pdf of the invoice. | [optional] |
| **prevent_send_by** | **bool**| Defines if u want to send the invoice. | [optional] |

### Return type

[**\Itsmind\Sevdesk\Model\InvoiceGetPdf200Response**](../Model/InvoiceGetPdf200Response.md)

### Authorization

[api_key](../../README.md#api_key)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `invoiceRender()`

```php
invoiceRender($invoice_id, $invoice_render_request): \Itsmind\Sevdesk\Model\InvoiceRender201Response
```

Render the pdf document of an invoice

Using this endpoint you can render the pdf document of an invoice.<br>       Use cases for this are the retrieval of the pdf location or the forceful re-render of a already sent invoice.<br>       Please be aware that changing an invoice after it has been sent to a customer is not an allowed bookkeeping process.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure API key authorization: api_key
$config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
// $config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'Bearer');


$apiInstance = new Itsmind\Sevdesk\Api\InvoiceApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$invoice_id = 56; // int | ID of invoice to render
$invoice_render_request = new \Itsmind\Sevdesk\Model\InvoiceRenderRequest(); // \Itsmind\Sevdesk\Model\InvoiceRenderRequest | Define if the document should be forcefully re-rendered.

try {
    $result = $apiInstance->invoiceRender($invoice_id, $invoice_render_request);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InvoiceApi->invoiceRender: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **invoice_id** | **int**| ID of invoice to render | |
| **invoice_render_request** | [**\Itsmind\Sevdesk\Model\InvoiceRenderRequest**](../Model/InvoiceRenderRequest.md)| Define if the document should be forcefully re-rendered. | [optional] |

### Return type

[**\Itsmind\Sevdesk\Model\InvoiceRender201Response**](../Model/InvoiceRender201Response.md)

### Authorization

[api_key](../../README.md#api_key)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `invoiceSendBy()`

```php
invoiceSendBy($invoice_id, $invoice_send_by_request): \Itsmind\Sevdesk\Model\InvoiceSendBy200Response
```

Mark invoice as sent

Marks an invoice as sent by a chosen send type.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure API key authorization: api_key
$config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
// $config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'Bearer');


$apiInstance = new Itsmind\Sevdesk\Api\InvoiceApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$invoice_id = 56; // int | ID of invoice to mark as sent
$invoice_send_by_request = new \Itsmind\Sevdesk\Model\InvoiceSendByRequest(); // \Itsmind\Sevdesk\Model\InvoiceSendByRequest | Specify the send type

try {
    $result = $apiInstance->invoiceSendBy($invoice_id, $invoice_send_by_request);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InvoiceApi->invoiceSendBy: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **invoice_id** | **int**| ID of invoice to mark as sent | |
| **invoice_send_by_request** | [**\Itsmind\Sevdesk\Model\InvoiceSendByRequest**](../Model/InvoiceSendByRequest.md)| Specify the send type | [optional] |

### Return type

[**\Itsmind\Sevdesk\Model\InvoiceSendBy200Response**](../Model/InvoiceSendBy200Response.md)

### Authorization

[api_key](../../README.md#api_key)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `sendInvoiceViaEMail()`

```php
sendInvoiceViaEMail($invoice_id, $send_invoice_via_e_mail_request): \Itsmind\Sevdesk\Model\SendInvoiceViaEMail201Response
```

Send invoice via email

This endpoint sends the specified invoice to a customer via email.<br>      This will automatically mark the invoice as sent.<br>      Please note, that in production an invoice is not allowed to be changed after this happened!

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure API key authorization: api_key
$config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKey('Authorization', 'YOUR_API_KEY');
// Uncomment below to setup prefix (e.g. Bearer) for API key, if needed
// $config = Itsmind\Sevdesk\Configuration::getDefaultConfiguration()->setApiKeyPrefix('Authorization', 'Bearer');


$apiInstance = new Itsmind\Sevdesk\Api\InvoiceApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$invoice_id = 56; // int | ID of invoice to be sent via email
$send_invoice_via_e_mail_request = new \Itsmind\Sevdesk\Model\SendInvoiceViaEMailRequest(); // \Itsmind\Sevdesk\Model\SendInvoiceViaEMailRequest | Mail data

try {
    $result = $apiInstance->sendInvoiceViaEMail($invoice_id, $send_invoice_via_e_mail_request);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling InvoiceApi->sendInvoiceViaEMail: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **invoice_id** | **int**| ID of invoice to be sent via email | |
| **send_invoice_via_e_mail_request** | [**\Itsmind\Sevdesk\Model\SendInvoiceViaEMailRequest**](../Model/SendInvoiceViaEMailRequest.md)| Mail data | [optional] |

### Return type

[**\Itsmind\Sevdesk\Model\SendInvoiceViaEMail201Response**](../Model/SendInvoiceViaEMail201Response.md)

### Authorization

[api_key](../../README.md#api_key)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)