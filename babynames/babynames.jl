#!/usr/bin/env julia


# function extract names from file


function extract_names(filename)
    text_string = open(readall, expanduser(filename))
    year_match = match(r"Popularity\sin\s(\d\d\d\d)", text_string)
    year = year_match.captures[1]
    pattern = r"<td>(\d+)</td><td>(\w+)</td><td>(\w+)</td>"
    name_array = matchall(pattern, text_string)
    name_dict = Dict()
    for line in name_array
        name_rank = match(pattern, line)
        rank, male, female = name_rank.captures
        if haskey(name_dict, male) == false
            name_dict[male] = rank
        end
        if haskey(name_dict, female) == false
            name_dict[female] = rank
        end
    end
    return year, name_array, name_dict
end

# parsing command line arguments and either
# writing to file or output to command line
# depending on if -summaryfile flag is present


if ARGS == false
    print("usage: babynames.jl [--summaryfile] filename")
    exit(0)
end

summary = false

if ARGS[1] == "--summaryfile"
    summary = true
else
    filename = ARGS[1]
end

year, name_array, name_dict = extract_names(filename);

summaryfile = filename * ".summary";

if summary == true
    f = open(expanduser(summaryfile), "w")
    write(f, year, "\n")
    for key in sort(collect(keys(name_dict)))
        write(f, "$key $(name_dict[key])", "\n")
    end
    close(f)
end

if summary == false
    for key in sort(collect(keys(name_dict)))
        println("$key => $(name_dict[key])")
    end
end
