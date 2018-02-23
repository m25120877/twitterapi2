import twitter4j.conf.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;

Twitter twitter;
java.util.List<Status> tweets;
void setup() {
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("MvxjLTFPXMmUl9rnbOEb8g");
  cb.setOAuthConsumerSecret("MW5vlozbE5Kih39Unr3QEN84Hdeu62bMFSQE80mIGY");
  cb.setOAuthAccessToken("18073451-mx4xEf42FhG4ZZASLADjnZyWGdUUfhxRfCbKLaWwa");
  cb.setOAuthAccessTokenSecret("M4ckfCU2L9YtQbHLyGjIRq6A42BDTwMUyCY4XItugSG5R");

  TwitterFactory tf = new TwitterFactory(cb.build());
  twitter = tf.getInstance();
  println(twitter);
  
}

void draw() {
}

void keyPressed() {
  String searchString = "selfie";

  try {
    Query query = new Query(searchString);

    QueryResult result = twitter.search(query);

    tweets = result.getTweets();
  }
  catch (TwitterException te) {
    System.out.println("Failed to search tweets: " + te.getMessage());
    System.exit(-1);
  }
  int i = 1;
  for (Status tweet : tweets) {
    println("----------- tweet #"+i+" ---------------");
    println(tweet.getText());
    i++;
  }
}