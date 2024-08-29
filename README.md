# TrainingContent

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://fieldofnodes.github.io/TrainingContent.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://fieldofnodes.github.io/TrainingContent.jl/dev/)
[![Build Status](https://github.com/fieldofnodes/TrainingContent.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/fieldofnodes/TrainingContent.jl/actions/workflows/CI.yml?query=branch%3Amain)

# TrainingContent

Welcome to the `TrainingContent` module! This Julia package is designed to assist in creating and managing training content schedules. It provides a structured way to generate training tables with content titles, types, and corresponding weeks.

## Features

- **Training Table Structure**: Defines a structure to hold and manage training content information, including weeks, content types, and titles.
- **Generate Weeks**: Dynamically create a sequence of weeks with optional randomization to distribute training content across a specified course length.
- **Create Training Tables**: Generate a complete training schedule with specified content titles and automatically assigned weeks.

## Installation

To use `TrainingContent`, ensure that you have Julia installed on your system. You can add this module to your Julia environment by including it in your project or environment:

```julia
] add https://github.com/your-repo/TrainingContent
```

## Usage

Begin by importing the module into your Julia environment:

```julia
using TrainingContent
```

### Training Table Structure

The core structure within this module is `TrainingTableData`, a mutable struct that holds the training schedule's information:

```julia
mutable struct TrainingTableData <: TrainingTableContents
    week_idx::Vector{Int}
    content_type::Vector{String}
    content_title::Vector{String}
end
```

This structure includes:

- `week_idx`: A vector of integers representing the week numbers.
- `content_type`: A vector of strings indicating the type of content (e.g., "Module").
- `content_title`: A vector of strings holding the titles of the training content.

### Generating Weeks

To generate a sequence of weeks, use the `generate_weeks` function:

```julia
weeks = generate_weeks(min_week::Int, max_week::Int, length::Int)
```

- `min_week`: The starting week number.
- `max_week`: The ending week number.
- `length`: The number of weeks to generate.

This function returns a vector of integers representing the weeks, with optional random noise added to create a non-linear distribution.

### Creating a Training Table

To create a training table with content titles distributed over a course length, use the `generate_TrainingTableData` function:

```julia
training_data = generate_TrainingTableData(content_title::Vector{String}; course_length::Int=104)
```

- `content_title`: A vector of strings representing the titles of the training modules.
- `course_length`: (Optional) The total length of the course in weeks, defaulting to 104 weeks.

This function returns an instance of `TrainingTableData` with week indices, content types (defaulting to "Module"), and the specified content titles.

### Example Usage

```julia
# Define your training content titles
titles = ["Introduction", "Advanced Techniques", "Review and Assessment"]

# Generate the training table data
training_schedule = generate_TrainingTableData(titles; course_length=52)

# Access the content
println(training_schedule.week_idx)
println(training_schedule.content_type)
println(training_schedule.content_title)
```

## Contributing

Contributions to `TrainingContent` are welcome! Please submit a pull request with your changes or open an issue if you encounter any problems.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions, suggestions, or feedback, feel free to reach out via [GitHub Issues](https://github.com/your-repo/TrainingContent/issues).

---

This README provides an overview of the functionality within `TrainingContent`. For detailed examples and additional information, please refer to the module's source code and documentation.
