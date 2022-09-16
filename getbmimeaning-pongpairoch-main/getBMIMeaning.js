const { template } = require('@babel/core')

function calculateBMI(weight,height) {
  //code here
        let BMI = (weight / (height * height) )
        return BMI
}
function getBMIMeaning(weight, height) {
  //code here

    let BMI = calculateBMI(weight,height)

    if (BMI < 18.5){return 'Underweight'}
    else if(BMI >18.4 && BMI <25){return'Normal weight'}
    else if(BMI >25) {return'Overweight'}
     

}

// console.log(getBMIMeaning(80, 1.7))  

module.exports = getBMIMeaning
