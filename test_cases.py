import pytest
import requests
import json


class TestCases:

    def test_get_homepage(self):

        url = "https://buythisspace.com.au/"
        headers = {
                   'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) '
                                 'Chrome/78.0.3904.97 Safari/537.36'
                   }
        response = requests.get(url, headers=headers)
        # response = json.loads(response.content)
        # print(response)

        if response.status_code != requests.codes.ok:
            raise AssertionError("Common validation is fail! the expected response code is %s, but the actual "
                                 "response status code result is %s"
                                 % (int(requests.codes.ok), response.status_code))
        else:
            print("The result is %s, " % response)


# if __name__ == "__main__":
