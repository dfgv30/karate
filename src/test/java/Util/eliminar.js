function cleanBody(body, fieldsToRemove) {
  for (var i = 0; i < fieldsToRemove.length; i++) {
    karate.remove(body, fieldsToRemove[i]);
  }
  return body;
}