"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.nextUntil = void 0;
/*
 * Get all following siblings of each element up to but not including the element matched by the selector
 * (c) 2017 Chris Ferdinandi, MIT License, https://gomakethings.com
 */
function nextUntil(elem, selector, filter) {
    const siblings = [];
    elem = elem.nextElementSibling;
    while (elem) {
        if (elem.matches(selector))
            break;
        if (filter && !elem.matches(filter)) {
            elem = elem.nextElementSibling;
            continue;
        }
        siblings.push(elem);
        elem = elem.nextElementSibling;
    }
    return siblings;
}
exports.nextUntil = nextUntil;
//# sourceMappingURL=utils.js.map