//------------------------------------------------------------------------
// 8-4
	var object = { property: 273 };
	
	var output = '';
	output += 'HOP(property) : '    + object.hasOwnProperty('property') + '\n';
	output += 'HOP(constructor) : ' + object.hasOwnProperty('constructor') + '\n';
	output += 'PIE(property) : '    + object.propertyIsEnumerable('property') + '\n';
	output += 'PIE(constructor) : ' + object.propertyIsEnumerable('constructor') + '\n';
	alert(output);
	
	for (var key in object) {
		alert(object[key]);
	}
	
//------------------------------------------------------------------------
// 8-7 ~ 8-9

	var numberFromLiteral = 273;
	var numberFromObject = new Number(273);
	
	var output = '';
	output += '1. ' + typeof(numberFromLiteral) + '\n';
	output += '2. ' + typeof(numberFromObject) + '\n';
	
	alert(output);
	
	// typeof
	if (typeof(numberFromLiteral) == 'number') {
		alert('numberFromLiteral은 숫자입니다.');
	}
	if (typeof(numberFromObject) == 'number') {
		alert('numberfromObject는 숫자입니다.');
	}
	
	// constructor
	if (numberFromLiteral.constructor == Number) {
		alert('numberFromLiteral은 숫자입니다.');
	}
	if (numberFromObject.constructor == Number) {
		alert('numberfromObject는 숫자입니다.');
	}

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//

//------------------------------------------------------------------------
//



































































































