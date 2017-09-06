#!/usr/bin/env node

  var fs = require('fs')
  var nunjucks = require('nunjucks')
  var argv = process.argv;
  var filePath = __dirname;
  var currentPath = process.cwd();
  //
  // console.log(filePath)
  // console.log(currentPath)

  // cli parse
  argv.shift()
  argv.shift()
  console.log(argv)
  console.log(currentPath);
  var data = JSON.parse(fs.readFileSync(filePath + '/json/'+argv+'.json'));
  for(value in data.titles){
    if(data.titles[value].subtitles){
      var flag=true;
      for(value2 in data.titles[value].subtitles){
        var field=null;
        if(!value2.includes(value.split('-')[0])){
          field=value+'.'+value2;
          if(!data.questions.fields[field]){
            field=field+'.1';
          }
          console.log(field);
          data.questions.fields[field].sub=data.titles[value].subtitles[value2].value;
          if(flag){
            data.questions.fields[field].main=data.titles[value].value;
            flag=false;
          }
          console.log(data.questions.fields[field]);
        }else{
          field=value2;
          if(!data.questions.fields[field]){
            field=field+'.1';
          }
          data.questions.fields[field].sub=data.titles[value].subtitles[value2].value;
          if(flag){
            data.questions.fields[field].main=data.titles[value].subtitles[value2].value;
            flag=false;
          }
          console.log(field);
          console.log(data.questions.fields[field]);
        }
        if(data.titles[value].subtitles[value2].subtitles){
          for(value3 in data.titles[value].subtitles[value2].subtitles){
            var field2=field;
            var field3=null;
            field3=value2+'.'+value3;
            console.log(field3);
            if(!data.questions.fields[field2].fields[field3]){
              field3=field3+'.1';
              field2=field3;
            }
            console.log(field3);
            if(!data.questions.fields[field2].fields[field3]){
              field3=field3+'.1';
            }
            console.log(field3);
            //console.log(data.titles[value].subtitles[value2].subtitles[value3].value);
            data.questions.fields[field2].fields[field3].thd=data.titles[value].subtitles[value2].subtitles[value3].value;
           
            console.log(data.questions.fields[field2]);
          }
        }
      }
    }else{
      var field=value+'.1';
      if(!data.questions.fields[field]){
        field=field+'.1';
      }
      data.questions.fields[field].main=data.titles[value].value;
      console.log(field);
      console.log(data.questions.fields[field]);
    }
  }
  //console.log('data = ');
  //console.dir(data);
  fs.writeFileSync(currentPath + '/'+argv+'.json',  JSON.stringify(data))
  // read tpl
  var tpl = fs.readFileSync(filePath + '/gen.tpl').toString()

  // console.dir(data)

  // tpl compile
  var compiledData = nunjucks.renderString(tpl,data)

  //console.log(compiledData)

  // write file
  fs.writeFileSync(currentPath + '/'+argv+'.html', compiledData)