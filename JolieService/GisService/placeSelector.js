function placeSelector(request){
    //print(request);
    var list = JSON.parse(request.list);
    var listLength = list.length;
    var index = Math.floor(Math.random() * listLength);
    return list[index].name;
}
