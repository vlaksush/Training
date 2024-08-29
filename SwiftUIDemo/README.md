# SwiftUI Demo

This repository contains the code and resources for the SwiftUI demo presentation.

## Outline

1. **Creating struct for the placeholder model to hold the transaction data**
   - Defining a `Transaction` struct to represent the transaction data
   - Specifying the properties of the `Transaction` struct (e.g., ID, name, amount, date)

2. **Enum and Type Safety**
   - Introducing an `TransactionType` enum to represent the different types of transactions
   - Ensuring type safety by using the enum in the `Transaction` struct

3. **Creating a view to display a list of transactions with sample data**
   - Implementing the `TransactionListView` to display the list of transactions
   - Populating the list with sample transaction data

4. **Creating a subview for the transaction row**
   - Developing the `TransactionRowView` to represent a single transaction in the list
   - Reusing the `TransactionRowView` in the `TransactionListView`

5. **Creating a transaction detail screen**
   - Implementing the `TransactionDetailView` to display detailed information about a selected transaction
   - Navigating to the `TransactionDetailView` from the `TransactionListView` using `NavigationView` and `NavigationLink`
   - Passing the selected `Transaction` data to the `TransactionDetailView`

6. **Reusing the loading data in `.onAppear` and refresh code**
   - Demonstrating the DRY (Don't Repeat Yourself) principle by reusing the transaction data loading logic in the `.onAppear` modifier
   - Implementing pull to refresh functionality.

## Usage

To use this SwiftUI demo, follow these steps:

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the app on the simulator or a physical device.
4. Explore the different views and functionality demonstrated in the app.

## Contributing

If you have any suggestions or find any issues, feel free to open a new issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).