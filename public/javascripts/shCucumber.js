SyntaxHighlighter.brushes.Cucumber = function()
{
	var funcs		= 'pizikabubu asdccdsdvvvf';
	var keywords	= 'Feature Scenario I And Then When Given In Order As a want';
	var operators	= 'asdcdcxzfddf maks ksmd asd dasaddasd';

	this.regexList = [
		{ regex: /--(.*)$/gm,												css: 'comments' },
		{ regex: SyntaxHighlighter.regexLib.multiLineDoubleQuotedString,	css: 'string' },
		{ regex: new RegExp(this.getKeywords(funcs), 'gmi'),				css: 'color2' },
		{ regex: new RegExp(this.getKeywords(operators), 'gmi'),			css: 'color1' },
		{ regex: new RegExp(this.getKeywords(keywords), 'gmi'),				css: 'keyword' }
		];
};
SyntaxHighlighter.brushes.Cucumber.prototype = new SyntaxHighlighter.Highlighter();
SyntaxHighlighter.brushes.Cucumber.aliases    = ['cuke'];
