SyntaxHighlighter.brushes.Cucumber = function()
{
	var funcs		= 'abs avg case cast';
	var keywords	= 'Feature Scenario I And Then When Given';
	var operators	= 'all and any between cross';

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
