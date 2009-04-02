Tidings
=============

Tidings is a simple wrapper around Andy Lester's [HTML::Tidy](http://search.cpan.org/dist/HTML-Tidy/ "HTML::Tidy on CPAN"), itself a wrapper around [libtidy](http://tidy.sourceforge.net/ "libtidy on sourceforge"). It's a convenient way of making sure that all your tags are closed and that your HTML is in squinting distance of validation, to avoid late-night typos producing a page full of red at the W3 Validator.

	<mt:section tidy="xhtml","numeric_entities:1;char_encoding:ascii;quote_marks:1;">
	<blockquote><p>The sun comes up, the tide rolls out<br>
	The trucks roll by the park still a park<br>
	Where children play and pick up stones<br>
	Anything to make them feel less alone - he's alone<br>
	His mind is his own town where all his thoughts run aground<br>
	They fall all over and down</p>
	&mdash; Fugazi, "Glue Man", <i>13 Songs<i>
	</mt:section>

This nasty code, with its doubled italics tags and missing &lt;/blockquote&gt;, is rendered as:

	<blockquote>
	<p>The sun comes up, the tide rolls out<br />
	The trucks roll by the park still a park<br />
	Where children play and pick up stones<br />
	Anything to make them feel less alone - he&amp;#39;s alone<br />
	His mind is his own town where all his thoughts run aground<br />
	They fall all over and down</p>
	&amp;mdash; Fugazi, &quot;Glue Man&quot;, <i>13 Songs</i></blockquote>

tidy is a content filter that takes &quot;xml&quot;, &quot;html&quot;, or &quot;xhtml&quot; as arguments&mdash;&quot;xhtml&quot; is the default value&mdash;and any number of HTML::Tidy arguments (strung together as key:value pairs and separated by semicolons) as an optional secondary option. Using Tidings and HTML::Tidy to clean up character encoding issues is doable but can be tricky depending on your database and DOCTYPE; a dedicated tool like [NaughtyWordChars](http://plugins.movabletype.org/naughtywordchar/ "NaughtyWordChars at plugins.movabletype.org") is more likely to succeed.
