library api_urls;

const int post = 1;
const int getUrl = 2;
const int put = 3;
const int multipart = 4;

const isLogEnabled = true;

const baseUrl = 'https://inspiredkinematics.com:2053/';
const getRequest = "inspiredkinematics.com:2053";
const masterProductsUrl = "master/products";

showLog(message) {
  if (isLogEnabled) {
    print(message);
  } else {}
}
