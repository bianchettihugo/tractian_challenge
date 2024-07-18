# Tractian Challenge - Mobile Flutter

https://github.com/user-attachments/assets/28b65b11-f846-428a-87cd-1301741e650c



# About

This project was developed using Flutter and adheres to the principles of Clean Architecture and SOLID. The architectural decisions were made with a focus on creating a maintainable, scalable, and robust application, ensuring that the codebase is easy to modify and maintain. Below is a brief explanation of some points of the code.


### Entities, models and builders

The models represent the data retrieved from the API, while entities are domain objects that the tree view interacts with. The models are constructed using builder classes that define the rules for creating a model based on the information contained in the map. With dependency injection, new builder implementations with different rules or new types of objects can be easily created. All models and entities inherit from a common superclass, allowing any subclass to be integrated into the tree view. This approach provides the flexibility to add new types of items beyond locations, assets, or components as needed.

### Datasources

I utilize two remote data sources implemented using the *http* package, and one local data source that manages and caches previously fetched items from the remote data sources. This caching mechanism improves performance by reducing the need for repeated network requests. I also used isolates to parse the json data from the api.

### Repositories and Usecases

To avoid repeated iterations, the items repository utilizes a stream to process data as it is converted to models, building the hierarchy on demand and returning it as a list of entities. The use cases interact with the repository to fetch items or retrieve filtered items based on names or status.
 
### Tree View and factories

The tree view receives a list of item entities and employs the factory pattern to determine which widget to draw based on the type of each item. Using dependency injection, the factory can be overridden, allowing new item types to be added to the tree view without modifying its existing code.

# Improvements
Although I strive to create solid code within a tight timeframe, there are several areas for improvement:

- Refine the filtering and querying mechanisms to support more complex queries in a single operation.
- Extract each possible filter from the items and add more filter options to the top bar.
- Develop unit tests and widget tests to ensure the functionality and reliability of the code.
- Implement pagination in the tree view to handle large datasets more efficiently.
