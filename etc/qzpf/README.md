Queasy post filter
==================

This is a standalone tool to turn my own mash-up of troff/nroff and
markdown into a regular HTML fragment for a the blog. The idea is
I compose a post in a temp file and filter it into a post and tags file.
There may be a separate prefilter to help with the tag selection.

Alternatively, I compose a post in a browser and the CGI back end uses
this to turn the POST data into a blog post.

The syntax was choosen to be both easy to type on a phone and easy to
remember. No markdown style `!()[]` business, an image looks like:
`.i image.jpg "alt text"` and any extra attributes after the alt text
are just added in to the tag.


Besides the filter, there is a tool to run a single test and a suite
of tests set up in `runtests`. Use the environment variable `USE_PERL`
to run the tests with a perl that is not "/usr/bin/perl".

Example
-------

Here is the input and output of the final, most complicated, test.

Input
```
Dog Toys

.t blog
.p
I don't know where it came from, but I do have _suspicions_, there
was a new dog toy in the yard today.
./p

.d imgbox
.i chews.png "chewey"
.p
So *green* and \`chewy\`.
.t green "chew toy"
./p
./d

.tf $here/$testname
.p
My dogs were only
.a https://video.invalid/video.mp4 "briefly" class=vidlink
interested.
./p
.tf $here/$testname.tags
```

Story output:
```
<h3>Dog Toys</h3>

<p>
I don't know where it came from, but I do have <i>suspicions</i>, there
was a new dog toy in the yard today.</p>

<div class="imgbox">
<img src="/qz/img/chews.png" alt="chewey" />
<p>
So <b>green</b> and <code>chewy</code>.</p></div>

<p>
My dogs were only
<a href="https://video.invalid/video.mp4" class=vidlink>briefly</a>
interested.</p>
```

Tags file output:
```
blog
green
```

vim tip
-------
Original `vi` and `vim` have some native support for *roff format files.
Specifically, the { and } paragraph movement commands know how to look
for paragraph start macros. The default idea of paragraphs is not useful
for this syntax, but it can be changed.

```
:set paragraphs=p\ hrbri\ d
```

The setting is a list of character *pairs* that follow a `.` in the
first column. It's made tricky by `"` starting a comment in the
settings, and `'` not working as a quote character there. So backslash
to escape whitespace. The changed version will accept `.p`, `.hr`,
`.br`, `.i`, and `.d` as marking new paragraphs. You might find that
image tags or line breaks shouldn't be counted, adjust to taste.

