/**
 * Created by danielezurico on 11/01/15.
 */

/** This is a work around to use hammerjs with requirejs
 * reference: https://github.com/hammerjs/hammer.js/issues/331
 **/
define(['hammer'], function (Hammer) {
  this.Hammer = Hammer;
  return Hammer;
});
