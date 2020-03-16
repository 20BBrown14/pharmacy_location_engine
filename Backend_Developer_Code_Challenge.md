# Backend Developer Code Challenge

## Objectives
1. Create a very basic API using tools and languages of your choice. The API will have a single enpoint/method with a single function.
2. The API will receive a latitude and longitude. Using the provided list of pharmacies in pharmacies.csv the API will calculate the closest pharmacy to the input.
3. The API will return the closest pharmacy in a consumable response packet that includes distance from, name, and address of the pharmacy.

## Technology
- Primary Language: Ruby on Rails (2.6.3, 6.0.2.1 respectively)
- Database: sqlite3
- Testing: rspec 3.9

## Action Plan
- Load data into application and decide schema
- Setup route to handle request and API requirements
- Create business logic for happy path
- Handle error cases and edge cases
- Write unit tests
- Linting and documentation

I decided to use a Ruby on Rails application because it allows for scalability and enhancements in the future very easily. I figured that if this coding challenge was a real user story there would be more in the future to add more functionality. Ruby on Rails is also able to serve a front-end javascript so there would be a clean portal for an end user to get the information they needed.

I wanted to use a database to store the data for the pharmacies for ease of use and also to easily change what data is available. The other option for this challenge would have been to load it every time the application starts or on each request and utilize a cache. In a production/real environment it would be more likely that this engine would make a request to another database somewhere and get that information (assuming this engine would be used to serve javascript).

## Challenges
I have used Ruby on Rails before in a couple different situations. What I had never done before, however, was 1.) use a database or 2.) start a brand new Ruby on Rails application from the ground up. Both of those points provided their own unique challenges.

Since I had not used a database before with Ruby on Rails I had to quickly become acquainted with best practices and performance. Fortunately there wasn't a ton of data or weird edge cases with the data but I definitely didn't want to edit the file or format of the data in anyway before it got to the database. I did however trim the data before it got to the database.

Starting a brand new Ruby on Rails application was a challenge simply because there were quite a few setup things that I had little experience with. Luckily documentation was plentiful and very helpful.

## Future Plans
If I was to continue this project there are a few improvements I would make outside of the original challenge given.
- Create a front end for a user to use the endpoint with
- Use Google Maps API to get distance based on driving or walking paths instead of with the haversine formula
- Allow for an address to be used as a user location
- Allow for a user to provide filters so they can find their nearest preferred pharmacy.
- Provide more endpoints that provide more functionality. Notably, return a list of nearby pharmacies, return contact info and store hours for a pharmacy, and return driving directions to a specific pharmacy.