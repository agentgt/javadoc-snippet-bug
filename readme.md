Minimal Project to reproduce bug in javadoc tool.

The tag "ok" is without the Eclipse formatting tags and works.

Once tags like `//@formatter:off` are added it breaks the javadoc tool.

My guess is the javadoc tool does not like any comments `//[ ]*@[A-Za-z0-9]+` in snippets as it thinks they are javadoc tags.
That maybe just an overall limitation but the error message could be improved.

To reproduce run `javadoc.sh` which is a bash script.

Output is below

```
Loading source files for package example...
Constructing Javadoc information...
Building index for all the packages and classes...
Standard Doclet version 21+35-LTS-2513
Building tree for all the packages and classes...
Generating out/javadoc/example/Example.html...
error: An internal exception has occurred.
  	(java.util.MissingResourceException: Can't find resource for bundle jdk.javadoc.internal.doclets.toolkit.resources.doclets, key spurious markup)
Please file a bug against the javadoc tool via the Java bug reporting page
(https://bugreport.java.com) after checking the Bug Database (https://bugs.java.com)
for duplicates. Include error messages and the following diagnostic in your report. Thank you.
java.util.MissingResourceException: Can't find resource for bundle jdk.javadoc.internal.doclets.toolkit.resources.doclets, key spurious markup
	at java.base/java.util.ResourceBundle.getObject(ResourceBundle.java:567)
	at java.base/java.util.ResourceBundle.getString(ResourceBundle.java:523)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.Resources.getText(Resources.java:88)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.Resources.getText(Resources.java:107)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.Messages.warning(Messages.java:196)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.taglets.SnippetTaglet.lambda$generateContent$1(SnippetTaglet.java:289)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.taglets.snippet.Parser.parse(Parser.java:164)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.taglets.snippet.Parser.parse(Parser.java:98)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.taglets.SnippetTaglet.parse(SnippetTaglet.java:370)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.taglets.SnippetTaglet.generateContent(SnippetTaglet.java:291)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.taglets.SnippetTaglet.getInlineTagOutput(SnippetTaglet.java:114)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.taglets.TagletWriter.getInlineTagOutput(TagletWriter.java:358)
	at jdk.javadoc/jdk.javadoc.internal.doclets.formats.html.HtmlDocletWriter.getInlineTagOutput(HtmlDocletWriter.java:379)
	at jdk.javadoc/jdk.javadoc.internal.doclets.formats.html.HtmlDocletWriter$2.defaultAction(HtmlDocletWriter.java:1458)
	at jdk.javadoc/jdk.javadoc.internal.doclets.formats.html.HtmlDocletWriter$2.defaultAction(HtmlDocletWriter.java:1232)
	at jdk.compiler/com.sun.source.util.SimpleDocTreeVisitor.visitSnippet(SimpleDocTreeVisitor.java:479)
	at jdk.compiler/com.sun.tools.javac.tree.DCTree$DCSnippet.accept(DCTree.java:1103)
	at jdk.compiler/com.sun.source.util.SimpleDocTreeVisitor.visit(SimpleDocTreeVisitor.java:79)
	at jdk.javadoc/jdk.javadoc.internal.doclets.formats.html.HtmlDocletWriter.commentTagsToContent(HtmlDocletWriter.java:1467)
	at jdk.javadoc/jdk.javadoc.internal.doclets.formats.html.HtmlDocletWriter.commentTagsToContent(HtmlDocletWriter.java:1179)
	at jdk.javadoc/jdk.javadoc.internal.doclets.formats.html.HtmlDocletWriter.addCommentTags(HtmlDocletWriter.java:1107)
	at jdk.javadoc/jdk.javadoc.internal.doclets.formats.html.HtmlDocletWriter.addInlineComment(HtmlDocletWriter.java:1088)
	at jdk.javadoc/jdk.javadoc.internal.doclets.formats.html.ClassWriterImpl.addClassDescription(ClassWriterImpl.java:194)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.builders.ClassBuilder.buildClassDescription(ClassBuilder.java:280)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.builders.ClassBuilder.buildClassInfo(ClassBuilder.java:157)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.builders.ClassBuilder.buildClassDoc(ClassBuilder.java:120)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.builders.ClassBuilder.build(ClassBuilder.java:98)
	at jdk.javadoc/jdk.javadoc.internal.doclets.formats.html.HtmlDoclet.generateClassFiles(HtmlDoclet.java:387)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.AbstractDoclet.generateClassFiles(AbstractDoclet.java:281)
	at jdk.javadoc/jdk.javadoc.internal.doclets.formats.html.HtmlDoclet.generateClassFiles(HtmlDoclet.java:199)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.AbstractDoclet.startGeneration(AbstractDoclet.java:207)
	at jdk.javadoc/jdk.javadoc.internal.doclets.toolkit.AbstractDoclet.run(AbstractDoclet.java:110)
	at jdk.javadoc/jdk.javadoc.doclet.StandardDoclet.run(StandardDoclet.java:104)
	at jdk.javadoc/jdk.javadoc.internal.tool.Start.parseAndExecute(Start.java:575)
	at jdk.javadoc/jdk.javadoc.internal.tool.Start.begin(Start.java:398)
	at jdk.javadoc/jdk.javadoc.internal.tool.Start.begin(Start.java:347)
	at jdk.javadoc/jdk.javadoc.internal.tool.Main.execute(Main.java:57)
	at jdk.javadoc/jdk.javadoc.internal.tool.Main.main(Main.java:46)
```
