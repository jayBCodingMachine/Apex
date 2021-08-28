trigger HelloWorldTrigger on Account (before insert) {
  System.debug('Hello World');
  System.debug(trigger.new);
}