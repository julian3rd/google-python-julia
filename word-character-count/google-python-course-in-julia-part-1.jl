
function import_lines(text_file)
    f = open(text_file)
    text_array = readlines(f)
    close(f)
    return text_array
end

book = "/Users/julian/GitHub/google-python-julia/word-character-count/irene-iddesleigh.txt";

irene_iddes = import_lines(book)

function normalize_lines(text_file)
    f = open(text_file)
    normalize_text = split(lowercase(string(readlines(f))))
    close(f)
    return normalize_text
end

normalized_irene_iddes = normalize_lines(book)

function normalize_lines(text_file)
    f = open(text_file)
    normalize_text = split(lowercase(string(readall(f))))
    close(f)
    return normalize_text
end

normalized_irene_iddes = normalize_lines(book)

function normalize_and_count(text_file)
    f = open(text_file)
    normalize_text = split(lowercase(string(readall(f))))
    close(f)
    word_dict = Dict()
    for word in normalize_text
        if haskey(word_dict, word) == false
            word_dict[word] = 1
        else
            word_dict[word] += 1
        end
    end
    return word_dict
end

irene_iddes_word_count = normalize_and_count(book)

irene_iddes_word_count["the"]

irene_iddes_word_count["which"]

irene_iddes_word_count["despondent"]

function normalize_and_char_count(text_file)
    f = open(text_file)
    normalize_text = split(lowercase(string(readall(f))))
    close(f)
    char_dict = Dict()
    for word in normalize_text
        split_word = split(word, "")
        for char in split_word
            if haskey(char_dict, char) == false
                char_dict[char] = 1
            else
                char_dict[char] += 1
            end
        end
    end
    return char_dict
end

irene_iddes_char_count = normalize_and_char_count(book);

irene_iddes_char_count["t"]

irene_iddes_char_count["h"]

irene_iddes_char_count["e"]

irene_iddes_char_count["z"]

versioninfo()
