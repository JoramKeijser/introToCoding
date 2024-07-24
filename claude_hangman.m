function claude_hangman()
    % Word list
    words = {'matlab', 'programming', 'computer', 'algorithm', 'function'};
    
    % Choose a random word
    word = lower(words{randi(length(words))});
    
    % Initialize game variables
    maxGuesses = 6;
    guessedLetters = '';
    guessesLeft = maxGuesses;
    
    % Main game loop
    while guessesLeft > 0
        % Display current state
        fprintf('\nWord: %s\n', getDisplayWord(word, guessedLetters));
        fprintf('Guesses left: %d\n', guessesLeft);
        fprintf('Guessed letters: %s\n', guessedLetters);
        
        % Get player's guess
        guess = lower(input('Enter a letter: ', 's'));
        
        % Validate input
        if length(guess) ~= 1 || ~isletter(guess)
            fprintf('Please enter a single letter.\n');
            continue;
        end
        
        % Check if letter has already been guessed
        if contains(guessedLetters, guess)
            fprintf('You already guessed that letter.\n');
            continue;
        end
        
        % Add guess to guessed letters
        guessedLetters = [guessedLetters, guess];
        
        % Check if guess is correct
        if contains(word, guess)
            fprintf('Correct guess!\n');
        else
            fprintf('Incorrect guess.\n');
            guessesLeft = guessesLeft - 1;
        end
        
        % Check for win condition
        if all(ismember(word, guessedLetters))
            fprintf('\nCongratulations! You guessed the word: %s\n', word);
            return;
        end
    end
    
    % Game over
    fprintf('\nGame over! The word was: %s\n', word);
end

function displayWord = getDisplayWord(word, guessedLetters)
    displayWord = '';
    for letter = word
        if contains(guessedLetters, letter)
            displayWord = [displayWord, letter];
        else
            displayWord = [displayWord, '-'];
        end
    end
end