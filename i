<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mini Wahl-O-Mat</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            background: white;
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            max-width: 500px;
            width: 100%;
        }
        h1 {
            text-align: center;
        }
        .question {
            margin: 15px 0;
        }
        button {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
        .result {
            text-align: center;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Mini Wahl-O-Mat</h1>
        <div id="quiz"></div>
        <button id="nextBtn">Nächste Frage</button>
        <div class="result" id="result"></div>
    </div>

    <script>
        const questions = [
            {
                question: "Soll die Schule später beginnen?",
                answers: ["Ja", "Nein"],
                points: [1, 0]
            },
            {
                question: "Soll mehr Geld in Umweltschutz investiert werden?",
                answers: ["Ja", "Nein"],
                points: [2, 0]
            },
            {
                question: "Soll Steuern für Reiche erhöht werden?",
                answers: ["Ja", "Nein"],
                points: [1, 0]
            }
        ];

        const parties = [
            {name: "Partei A", score: 0},
            {name: "Partei B", score: 0},
            {name: "Partei C", score: 0}
        ];

        let current = 0;

        const quizDiv = document.getElementById("quiz");
        const nextBtn = document.getElementById("nextBtn");
        const resultDiv = document.getElementById("result");

        function showQuestion() {
            if(current >= questions.length) {
                showResult();
                return;
            }
            const q = questions[current];
            quizDiv.innerHTML = `<div class="question">${q.question}</div>`;
            q.answers.forEach((ans, i) => {
                const btn = document.createElement("button");
                btn.textContent = ans;
                btn.onclick = () => selectAnswer(q.points[i]);
                quizDiv.appendChild(btn);
            });
        }

        function selectAnswer(points) {
            // Zufällige Zuweisung: hier nur Demo, Punkte zu Parteien
            parties.forEach(p => p.score += points);
            current++;
            showQuestion();
        }

        function showResult() {
            quizDiv.innerHTML = "";
            nextBtn.style.display = "none";
            const winner = parties.reduce((a,b) => a.score > b.score ? a : b);
            resultDiv.textContent = `Deine Partei: ${winner.name}`;
        }

        nextBtn.addEventListener("click", showQuestion);

        // Starte Quiz
        showQuestion();
    </script>
</body>
</html>
