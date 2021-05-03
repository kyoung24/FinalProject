function [] = finalGradeCalculator(calculateButton, event, grades, weights, desiredGrade, finalExamWeight)

    %if-statements used to make sure that data is inputted and of the
    %correct type and format
    if isempty(get(grades,'string')) == 1 || isempty(regexp(get(grades,'string'), '([0-9][\.][0-9]+)+', 'once')) == 1
        
        fprintf("Please Enter Grade Values\n");
        
    elseif isempty(get(weights, 'string')) == 1 || isempty(regexp(get(weights,'string'), '([0-9][\.][0-9]+)+', 'once')) == 1
        
        fprintf("Please Enter Weight Values\n");
        
    elseif isempty(get(desiredGrade, 'string')) == 1 || isempty(regexp(get(desiredGrade,'string'), '([0-9][\.][0-9]+)', 'once')) == 1
        
        fprintf("Please Enter A Desired Grade Value\n");
        
    elseif isempty(get(finalExamWeight, 'string')) == 1 || isempty(regexp(get(finalExamWeight,'string'), '([0-9][\.][0-9]+)', 'once')) == 1
        
        fprintf("Please Enter The Weight of The Final Exam\n");
        
    else

    %converts input from a string to a double array so that mathematical
    %operations can be done on the data
    userInputGradesString = strsplit(get(grades, 'string'),',');
    userInputGrades = str2double(userInputGradesString);
    
    userInputWeightsString = strsplit(get(weights, 'string'),',');
    userInputWeights = str2double(userInputWeightsString);
    
    %if-statement that checks to make sure that each grade has a
    %corresponding weight
    if length(userInputGrades) ~= length(userInputWeights)
        
        fprintf("Grades And Weights Must Be of Equal Length\n");
        
    else
    
    userInputDesiredGrade = str2double(get(desiredGrade, 'string'));
    
    userInputFinalWeight = str2double(get(finalExamWeight, 'string'));

    categoryGrade = zeros(1,length(userInputGrades));
    
    sumOfGrades = 0;
    
    %a for-loop that will go through the inputted grades and corresponding
    %weights and save the results in a new array. Then sum them all up to
    %get a total grade
    for i = 1:length(userInputGrades)
        
        categoryGrade(i) = (userInputGrades(i)) * (userInputWeights(i));
        sumOfGrades = sumOfGrades + categoryGrade(i);
        
    end
    
    %calculation for finding the grade the user must get on their final
    %exam to get the desired graded inputted.
    finalGradeNeeded = ((userInputDesiredGrade - sumOfGrades)/(userInputFinalWeight)) * 100;
    
    desiredPercent = userInputDesiredGrade * 100;
    
    fprintf("You would need a %d on the final exam to get a %d in the class.\n",int16(finalGradeNeeded),int16(desiredPercent));
    
    end
    
    end
    
end
        
function [] = overallGradeCalculator(finalGradeButton, event, grades, weights, finalExamGrade, finalExamWeight)

    %if-statements used to make sure that data is inputted and of the
    %correct type and format
    if isempty(get(grades,'string')) == 1 || isempty(regexp(get(grades,'string'), '([0-9][\.][0-9]+)+', 'once')) == 1
        
        fprintf("Please Enter Grade Values\n");
        
    elseif isempty(get(weights, 'string')) == 1 || isempty(regexp(get(weights,'string'), '([0-9][\.][0-9]+)+', 'once')) == 1
        
        fprintf("Please Enter Weight Values\n");
        
    elseif isempty(get(finalExamWeight, 'string')) == 1 || isempty(regexp(get(finalExamWeight,'string'), '([0-9][\.][0-9]+)', 'once')) == 1
        
        fprintf("Please Enter The Weight of The Final Exam\n");
        
    elseif isempty(get(finalExamGrade, 'string')) == 1 || isempty(regexp(get(finalExamGrade,'string'), '([0-9][\.][0-9]+)', 'once')) == 1
        
        fprintf("Please Enter Your Grade On The Final Exam\n");
        
    else
        
    %converts input from a string to a double array so that mathematical
    %operations can be done on the data
    userInputGradesString = strsplit(get(grades, 'string'),',');
    userInputGrades = str2double(userInputGradesString);
    
    userInputWeightsString = strsplit(get(weights, 'string'),',');
    userInputWeights = str2double(userInputWeightsString);
    
    %if-statement that checks to make sure that each grade has a
    %corresponding weight
    if length(userInputGrades) ~= length(userInputWeights)
        
        fprintf("Grades And Weights Must Be of Equal Length\n");
        
    else
        
    userInputFinalExamGrade = str2double(get(finalExamGrade, 'string'));
    
    userInputFinalWeight = str2double(get(finalExamWeight, 'string'));

    categoryGrade = zeros(1,length(userInputGrades));
    
    sumOfGrades = 0;
    
    %a for-loop that will go through the inputted grades and corresponding
    %weights and save the results in a new array. Then sum them all up to
    %get a total grade
    for i = 1:length(userInputGrades)
        
        categoryGrade(i) = (userInputGrades(i) * userInputWeights(i));
        sumOfGrades = sumOfGrades + categoryGrade(i);
        
    end
    
    %calculation needed to get the users overall grade in the class in
    %percentage form.
    overallGrade = (sumOfGrades + (userInputFinalExamGrade * userInputFinalWeight)) * 100;
    
    fprintf("You got a %d in the class.\n", int16(overallGrade));
    
    end
    
    end
    
end