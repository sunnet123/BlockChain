const express = require("express");
const app = express();
const PORT = 3000;

//public 폴더를 기본 정적 폴더로 지정(use 미들웨어)
app.use(express.static(__dirname + "/public"));

//라우팅 정의 -> 기본(default) 파일 지정
app.get("/", (req, res) => {
    res.sendFile(__dirname + "/index.html");
});

// 서버 실행
app.listen(PORT, () => {
    console.log(`Listen : ${PORT}`);
});
