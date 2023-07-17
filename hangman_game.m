
%% Intro to coding - hangman game

% This is the script file for the game of hangman, inspired from https://bpb-us-w2.wpmucdn.com/u.osu.edu/dist/1/84063/files/2019/11/Hangman.pdf 
clc
clear
% Welcome the player
disp('Welcome to the game of Hangman!')

disp(['The game of Hangman is a one player game that requires ', ...
        'you to guess lowercase letters (a-z) to try to guess a word. You ', ...
        'have 8 lives. You lose a life for each wrong letter. ', ...
        'Good luck!'])
pause(1) % allow time for them to read the instructions for 12 seconds


playAgain = 1; % assign initial value so game can start

while playAgain == 1
    % Create a word bank
    wordBank = {'lab', 'neuroscience', 'brain', 'computer', 'programming'};

    randomNumber = randi(size(wordBank), 1); % Get a random index 
    currentWord = wordBank{randomNumber}; % index the bank and get the current word to guess

    currentNumberLetters = length(currentWord); % length of the word
    currentNumberLives = 8; % start with 8 lives

    % Get empty array of dashes of the same length as the word to guess 
    wordSpaces = char(currentNumberLetters); % initialize character array
    wordSpaces(1:currentNumberLetters) = '-'; % all the dashes
    disp(wordSpaces)

    % Get an empty array of guessed letters 
    guessedLetters = '';

    while currentNumberLives > 0 % execute this loop while the player still has lives 
        disp(['You have ' num2str(currentNumberLives) ' lives left.']) % number of lives
        guess = input('Please guess a lowercase letter: ', 's'); % request letter
        for iGuess = 1:currentNumberLetters
            if guess == currentWord(iGuess) % does the guess matches any letters in the word
                wordSpaces(iGuess) = guess; % sets the guess into the spaces if there is a match
                correctGuess = 1;
                fprintf('You guessed correctly!')
            else
                correctGuess = 0;
            end
        end
        if correctGuess == 0 %if they guessed a wrong letter, lose a life
            currentNumberLives = currentNumberLives - 1;
        end

        guessedLetters = [guessedLetters, guess];
        disp(['Your guessed letters are:', guessedLetters]) % print the guessed letters so far
        disp(wordSpaces) % display the guessed letters in the word
       
        % Check to see if the full word has been found yet
        if wordSpaces == currentNumberLetters
            clear('guessedLetters', 'wordSpaces')
            disp(currentWord) % show the word
            fprintf('You guessed the word!\n') % they solved the puzzle!
            playAgain = input(['Would you like to play again?(1 = Yes or ' ...
                '0 = No):']); % ask if they want to play again
            break % break out of inner while loop to start a new game
        end
        if currentNumberLives == 0
            clear('guessedLetters', 'wordSpaces')
            disp(['You ran out of lives ! The word was: ' currentWord]) % no more lives
             playAgain = input(['Would you like to play again?(1 = Yes or ' ...
                '0 = No):']); % ask if they want to play again
            break % break out of inner while loop to start a new game
        end
    end
end


% some other nice resources:
% https://github.com/JoanAguilar/MatlabGames