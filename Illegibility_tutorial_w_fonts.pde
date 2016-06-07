// Experiment in Illegibility: Tutorial

/*    The text: This is what is in the text file in the data folder
We, the Global Studies Steering Committee, regret to inform you that after seven years of successful 
faculty development, student-focused programming, and contributions to faculty recruitment, retention, 
and diversity, the Provost and Dean of Faculty Patrick Spencer has unilaterally, and without consulting 
the Steering Committee or Global Studies Director, suspended the Global Studies Initiative for the 
2016-2017 academic year.  
*/


// Global variable(s)

int index = 0;  
// Used near the end to count through the array and to know when to start over
// (This variable declaration works in global variables [before setup], but not in draw, 
     // likely because of the constant refresh in draw setting it back to 0 each time)

void setup() {
  size(1270,500);       // Window size
  textAlign(CENTER);    // Centers the text on the coordinate where told to draw
}
  
  
void draw() {
  
  // Set frame rate
  // Could also be done in setup() and then again at the end of the if statement to restart at the end (in draw)
  int normFrameRate = 3;
  frameRate(normFrameRate); //Reset to normal framerate after restarting each time through
  
  // Background
  background(255);  // Draws background again each time through draw to animate
  
  // Fonts to apply randomly
  // Array of fonts (as many as needed, since the number isn't hardcoded in this example)
  // Tools > Create Font
  // Load fonts that are at least as large as you need, as re-setting the font size (fontSize()) 
       // to larger than what is available will make the letters start to pixelate
  // Loaded fonts can be found in the data folder
  PFont[] font = {loadFont("AbadiMT-CondensedExtraBold-150.vlw"),
                  loadFont("ACaslonPro-Bold-150.vlw"),
                  loadFont("Garamond-Bold-150.vlw"),
                  loadFont("SansSerif-150.vlw"),
                  loadFont("Serif-150.vlw")};
  
  
  // Create array of words from a text file
    // Text file must be plain text .txt, or there will be formatting junk before the paragraph/text starts and there will be a "}" at the end.
    // You can change a .txt to plain text in TextEdit (or a similar program). In TextEdit, the option is under the Format menu.
  String[] document = loadStrings("GSI_P_1.txt");   // Calls the text file from your data folder and loads it (by line breaks) into an array.
  String GSI = join(document, " ");   // joins together what would otherwise be each line in a different spot in an array into one long string
  String[] words = split(GSI, " ");   // splits paragraph (long single string) at spaces (" ") into different cells
  // Those last two steps are important especially if you have multiple paragraphs with line breaks.
  // This example code uses only one paragraph, but it's formatted for use with any text file.
  
  // Select a random font from the array
  fill(0);  // Set paragraph text color to black
  textFont(font[int(random(font.length-1))]);   // Adjusts maximum random # depending on number of fonts in array
  textSize(150);   // Set font size  (remember to make this less than or equal to the size you set when creating the font)

  // Draw word to screen, cycle through text
     // Borrowing method of cycling through words from Shiffman vid: “18.1 ICM: loadStrings()”   (https://vimeo.com/109529516)
  text(words[index], width/2, (height/2)+30);  // Places centered text (see setup section) in middle of window.
                                               // The +30 helps place the text a little lower, where I thought it looked better
  index++;  // Iterates through the array of words, using the "index" variable declared in the global section (top, before setup)
   
   
  // Restart paragraph from beginning.
  if(index == words.length)   // When index reaches the end of the text (length of array), start over
  {
    frameRate(0.6);  // Adds a pause before restarting
    index = 0;       // Sets index back to 0 to start from the beginning of the text
  }  
  
  
  /* NOTES
 ---------------------------------------------------------------------------------------------------------------



  */
}