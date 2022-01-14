int startMillis = 0;
int currIndex = 0;
int[] times = new int[5];
String currPattern = "";
String currStr = "";
String[] translations;
char[] alpha = new char[26];

void setup()
{
  size(500,100);
  for (int i = 97; i < 123; i++)
  {
    alpha[i-97] = char(i);
  }
  reset();
  translations = loadStrings("morse.txt");
}
void draw()
{
  background(0);
  stroke(255);
  fill(255);
  textSize(24);
  text(currStr,10,30);
}
void keyPressed()
{
  if (keyCode != ENTER)
  {
    startMillis = millis();
  }
  else
  {
    int minTime = min(times);
    for (int i = 0; i < currIndex; i++)
    {
      if (round(float(times[i])/float(minTime)) == 1 && minTime < 100)
      {
        currPattern += ".";
      }
      else
      {
        currPattern += "-";
      }
    }
    int upper = (5-currPattern.length());
    for (int i = 0; i < upper; i++)
    {
      currPattern += "0";
    }
    for (int i = 0; i < translations.length; i++)
    {
      if (translations[i].equals(currPattern))
      {
        currStr += alpha[i];
        break;
      }
    }
    currIndex = 0;
    reset();
  }
}
void keyReleased()
{
  if (keyCode != ENTER && currIndex < 5)
  {
    times[currIndex] = millis()-startMillis;
    currIndex++;
  }
}
void reset()
{
  for (int i = 0; i < times.length; i++)
  {
    times[i] = 100000;
  }
  currPattern = "";
}
