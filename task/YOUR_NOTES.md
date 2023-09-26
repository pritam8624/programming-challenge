## Getting Started

### Install dependencies

In your terminal, after unzipping the file, run the following commands

```sh
cd programming-challenge
bundle install
```
**NOTE**: If you do not have bundler installed, then run the following command

```sh
gem install bundler
```

## Usage

### Running the app

In the root folder of the project, you can run the app by using the following command:

```sh
ruby app.rb
```

By default, the path for the input file is `./task/search.xml`, but you can also pass a different path as an argument so you can also run the following command - making sure to replace `/path/to/your/file.xml` with the actual path of the file you want to parse:

```sh
ruby app.rb /path/to/your/file.xml
```

The output will consist of a description of the journey, the various options with their connections and their changes, the fares, the cheapest and quickest options (as per the directions).

## Automated Testing

### Run the automated tests

In the root folder of the solution, run the following command

```sh
rspec
```
