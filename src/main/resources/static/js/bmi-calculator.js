function calculateAll(){

    let h = document.getElementById("height").value;
    let w = document.getElementById("weight").value;
    let age = document.getElementById("age").value;
    let gender = document.getElementById("gender").value;
    let activity = document.getElementById("activity").value;

    if(!h || !w){
        alert("Enter height & weight");
        return;
    }

    h = h / 100;

    let bmi = (w / (h*h)).toFixed(1);

    let status = "";
    let color = "";
    let progress = Math.min((bmi / 40) * 100, 100);

// BMI STATUS
    if(bmi < 18.5){
        status = "Underweight";
        color = "#3498db";
    }
    else if(bmi < 25){
        status = "Healthy";
        color = "#2ecc71";
    }
    else if(bmi < 30){
        status = "Overweight";
        color = "#f39c12";
    }
    else{
        status = "Obese";
        color = "#e74c3c";
    }

// BMR CALCULATION
    let bmr = 0;

    if(gender === "male"){
        bmr = 10*w + 6.25*(h*100) - 5*age + 5;
    }else if(gender === "female"){
        bmr = 10*w + 6.25*(h*100) - 5*age - 161;
    }

    let calories = activity ? Math.round(bmr * activity) : 0;

// SHOW RESULT
    document.getElementById("resultBox").classList.remove("d-none");

    document.querySelector(".result-text").innerHTML =
        `BMI: <b>${bmi}</b> (${status})`;

    let bar = document.getElementById("bmiBar");
    bar.style.width = progress + "%";
    bar.style.background = color;

    document.querySelector(".bmr-text").innerHTML =
        calories ? `Daily Calories: <b>${calories} kcal</b>` : "";

}