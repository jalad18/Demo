# Real Estate App

This is a real estate app built with Ruby on Rails that allows users to interact with each other, publish properties, access live news, and search for properties by city name. The app has user roles for agents and customers, with different permissions and features for each role.

## Features

### User Roles 👔🏢

- **Agent**: Agents have the right to publish properties on the platform. They can also send emails to customers who contact them through the "Contact Now" feature.
- **Customer**: Customers can browse and search for properties, view the list of all agents, and contact agents for inquiries.

### Chat Functionality 💬

- All users can participate in individual and group chats. This feature allows users to communicate with each other easily and efficiently.

### Multilingual Support 🌐

- The app supports multiple languages, allowing users to select their preferred language for a better user experience.

### Live News 📰

- All users can access live news within the app. The news section keeps users informed about the latest updates and developments in the real estate market.

### Authorization 🔒

- The app uses the CanCan gem for authorization to manage user permissions and access control.

### Property Search 🔍

- Users can search for properties by city name, making it easy to find properties in specific locations.

### Pagination 📄

- The app uses the Kaminari gem for pagination, ensuring a smooth browsing experience for users when viewing lists of properties and other resources.

## Getting Started 🚀

To run the app locally, follow these steps:

1. Clone the repository to your local machine.
2. Install Ruby and Ruby on Rails, if not already installed.
3. Install dependencies by running `bundle install`.
4. Set up the database by running `rails db:create` and `rails db:migrate`.
5. Optionally, you can seed the database with sample data using `rails db:seed`.
6. Start the server with `rails server`.
7. Access the app in your web browser at `http://localhost:3000`.

## User Authentication 🔒

- The app includes user authentication with role-based permissions.
- Users can sign up or log in to access the features based on their role (agent or customer).

## Property Management 🏠

- Agents can publish properties with details such as name, location, price, and status.
- Customers can search and view properties, but only agents can publish and manage them.

## Chat System 💬

- Users can communicate with each other through individual and group chats.
- Individual chats allow one-on-one conversations, while group chats enable multiple users to participate in a discussion.

## Contact Agent 📧

- Customers can contact agents by clicking on the "Contact Now" button on a property listing.
- When a customer clicks the button, the agent receives an email with the customer's inquiry.

## Agent List 📋

- Customers can view the list of all agents on the platform and access their profiles for further information.

## Multilingual Support 🌐

- The app provides support for multiple languages, and users can choose their preferred language in the settings.

## Live News Section 📰

- The app includes a live news section that displays the latest real estate news to keep users informed about the industry's developments.

## Technologies Used 🛠️

- Ruby on Rails
- PostgreSQL (or any other supported database)
- Devise gem for user authentication
- CanCan gem for authorization
- Action Mailer for email notifications
- Action Cable for real-time chat functionality
- Redis (or any other supported cache store) for Action Cable
- Bootstrap (or any other CSS framework) for styling
- Kaminari gem for pagination

## Contributions 🤝

Contributions to the project are welcome! If you have any suggestions or find any issues, please feel free to open an issue or submit a pull request.

## Authors 👩🏻‍💻👨🏻‍💻

- Jalad Shrimali (https://github.com/jalad18)
