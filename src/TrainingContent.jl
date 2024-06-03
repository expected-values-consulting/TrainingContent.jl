module 

using Revise

export 
    TrainingTableContents,
    TrainingTableData,
    contents_range,
    generate_TrainingTableData

    abstract type TrainingTableContents end

    mutable struct TrainingTableData <: TrainingTableContents
        week_idx::Vector{Int}
        content_type::Vector{String}
        content_title::Vector{String}
    end

    function contents_range(ttd::TrainingTableData)
        Base.OneTo(length(ttd.content_title))
    end

    function generate_weeks(min_week::Int, max_week::Int, length::Int)
        # Generate a sequence of evenly spaced numbers between min_week and max_week
        weeks = Base.range(min_week, max_week, length=length)
        
        # Add some random noise to these numbers
        noise = rand(length) .* (max_week - min_week) / length
        weeks = weeks .+ noise
        
        # Make sure the first and last elements are min_week and max_week, respectively
        weeks[1] = min_week
        weeks[end] = max_week
        
        return Int.(round.(weeks,digits=0))
    end

    function generate_TrainingTableData(content_title::Vector{String};course_length::Int=104)
        len = length(content_title)
        # Generate a random sequence of weeks
        weeks = generate_weeks(1, course_length, len)
        
        # Generate a random sequence of content types
        content_type = fill("Module",len)
        
        return TrainingTableData(weeks, content_type, content_title)
    end

end
