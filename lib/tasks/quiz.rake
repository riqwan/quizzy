namespace :quiz do
  desc 'Create a sample quiz'
  task populate: :environment do
    QUESTIONS = [
      {
        text: "What is Harry's full name?",
        choices: [
          { text: 'Harry Evans Potter', correct: false },
          { text: 'Harry James Potter', correct: false },
          { text: 'James Harry Potter', correct: true },
          { text: 'Harry Potter Evans', correct: false },
          { text: 'Harry Severus Potter', correct: false }
        ]
      },
      {
        text: "When is Harry's birthday?",
        choices: [
          { text: 'July 31 1980', correct: true },
          { text: 'July 31 1986', correct: false },
          { text: 'July 31 1995', correct: false },
          { text: 'July 31 1990', correct: false },
          { text: 'July 31 1974', correct: false }
        ]
      },
      {
        text: "Where did Harry first meet Hagrid?",
        choices: [
          { text: "At the Sorting Ceremony", correct: false },
          { text: "At the Dursley's home", correct: true },
          { text: "At Hogwarts", correct: false },
          { text: "In an abandon shack on the lake", correct: false },
          { text: "On Platform 9 3/4", correct: false }
        ]
      },
      {
        text: "What did Hagrid give Harry for his 11th birthday?",
        choices: [
          { text: "A copy of Quidditch Through the Ages", correct: true },
          { text: "A pet spider", correct: false },
          { text: "A baby dragon", correct: false },
          { text: "Tickets to the Quidditch World Cup", correct: false },
          { text: "A homemade birthday cake", correct: false }
        ]
      },
      {
        text: "What did Hagrid curse Dudley with?",
        choices: [
          { text: "Boils", correct: false },
          { text: "A dizzying charm", correct: false },
          { text: "A tickling charm", correct: false },
          { text: "A pig's tail and nose", correct: true },
          { text: "He removed the bones in his legs", correct: false }
        ]
      }
    ]

    Quiz.transaction do
      quiz = Quiz.create!(name: "The Philosopher's Stone Quiz")

      QUESTIONS.each do |question_hash|
        question = quiz.questions.create!(text: question_hash.fetch(:text))

        question_hash.fetch(:choices).each do |choice|
          question.choices.create!(text: choice.fetch(:text), correct: choice.fetch(:correct))
        end
      end
    end
  end
end
