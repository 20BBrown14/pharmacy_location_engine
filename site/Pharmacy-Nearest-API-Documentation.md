# Pharmacy Nearest

## Resources

### Retrieve nearest pharmacy

Retrieve the nearest pharmacy to given lat/long points from a list of pharmacies in the database.

#### Query Parameters
* latitude - String latitude value for the user's location
* longitude - String longitude value for the user's location

#### Request
<pre>
GET {root}/pharmacy/nearest?latitude=<:latitude>&longitude=<:longitude>
</pre>

#### Response Codes
* 200 - OK, contains the nearest pharmacy's name, address (including street address, city, state, and zip), and distance, in miles, from given coords.
* 400 - Bad Request, empty response body
* 500 - Internal Error, empty response body

#### Response
<pre>
:nearestPharmacy - Hash with nearest pharmacy information
                  :name - String name of the pharmacy
                  :address - String street address of the pharmacy
                  :city - String city the pharmacy is in
                  :state - String state the pharmacy is in
                  :zip - String zipcode for the pharmacy
                  :distance - Float distance, in miles, pharmacy is from user location
</pre>

#### Sample Response
<pre>
HTTP:/1.1 200 OK
Content-Type: application/json; charset=utf-8
{
  "nearestPharmacy": {
    "name": "GOOD PHARMACY"
    "address": "8596 RX ROAD"
    "city": "KANSAS CITY"
    "state": "KS"
    "zip": "99999"
    "distance": 8.425
  }
}
</pre

