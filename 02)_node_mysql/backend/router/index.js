var express = require('express');
// express의 안에 있는 Router기능 사용하기 위해 router를 선언
// ()는 함수를 표현
var router = express.Router();
// 선언한 Path를 import 
const path = require('path');

// Get home Page. 

// .get는 렌더할때 사용
// function(req,res,next)는 우리가 요청하거나 이후에 어떤것을 할지 선언
router.get('/', function(req,res,next){
    // sendFile 파일 불러와서 렌더링 역할을 한다
    //path.join은 상대적 위치를 조정할때 사용 
    // __dirname은 현재 있는 파일의 위치
    res.sendFile(path.join(__dirname+'../../../frontend/view/index.html'));
})

// router를 모듈화 
// 다른 페이지에서 index를 가지고 router만 선언할수 있는 해주는 역할이다.
module.exports = router

