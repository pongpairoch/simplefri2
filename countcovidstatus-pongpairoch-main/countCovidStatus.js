const { template } = require('@babel/core')

//put your student id, name, and surname here
// 64130500053 pongpairoch suphaphon
function countCovidStatus(covidStatusArray) {
  //code here
  const covid =["covid"]
  let arr = []
  longest = { }
  let str = ""
  test = []
  if (covidStatusArray == null || undefined){
    return undefined }

    else if (covidStatusArray == []){
      return {}
    }
   
    else{
      for (let i = 0; i < covidStatusArray.length; i++) {
        if (covidStatusArray == 'covid'){
          return {}
        }
     
      }
     
      arr.push(covidStatusArray[i])
        longest = Object.assign({}, arr)
  
    }
    return longest; 
  

    
    
  }

 
  

module.exports = countCovidStatus
