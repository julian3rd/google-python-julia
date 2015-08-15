#!/usr/bin/env julia

# function to get file paths in directory
function get_special_paths(dir)
    """Prints the absolute paths of each of the 'special' files in 
    the directory """
    filenames = readdir(expanduser(dir));
    special_list = matchall(r"\w+__\w+__.\w+", join(filenames, " "));
    if length(special_list) == 0
        print("Special files not found in this directory", "\n")
    else
        print("Special files found in this directory", "\n")
    end
    special_paths = ASCIIString[];
    for file in special_list;
        push!(special_paths, abspath(file));
        print(abspath(file), "\n")
    end
    return special_paths
end

# function to copy files
function copy_to(source_dir, target_dir)
    """ Copies file_list from source_dir into target_dir
    If target_dir does not exist, it is created with a warning.
    Calls get_special_path() to get source directory and then proceeds."""
    special_paths = get_special_paths(source_dir);
    target_path = expanduser(target_dir);
    if isdir(expanduser(target_dir)) == true
        for dir_file in special_paths
            run(`cp $dir_file $target_path`)
        end
    else
        mkpath(target_path)
        print("Target did not exist, so it was created prior to copying.", "\n")
        for dir_file in special_paths
            run(`cp $dir_file $target_path`)
        end
    end
end

# function to create ZIP archive
function zip_to(source_dir, zip_file)
    """ create ZIP archive of the special files.
    Gives zip -j error message if command fails.
    Calls get_special_paths() first to get list of files."""
    special_paths = get_special_paths(source_dir);
    zip_path = expanduser(zip_file)
    try run(`zip -j $zip_path $special_paths`)
        print("Creating ZIP archive")
    catch err
        showerror(STDOUT, err, backtrace())
    end
end

# argument structure specifications
directory = ARGS[3]

if ARGS[1] == "--todir"
    todir = true
end

if ARGS[1] == "--tozip"
    tozip = true
end

if todir == true
    file_paths = get_special_paths(directory);
    copy_to(directory, ARGS[2]);
elseif tozip == true
    file_paths = get_special_paths(ARGS[3]);
    zip_to(directory, ARGS[2]);
else
    print(join(file_paths, "\n"))
end
