import { XML2JSONParseDoc, ChapterContexts } from "./xml_json_types"

type KeyTypes = {
  commonKeys: Set<string>
  optionalKeys: Set<string>
}
/**
 * list all chapter contexts */

export function listChapterContexts(doc: XML2JSONParseDoc) {
  const contexts = new Set<string>()
  doc.map((item) => {
    item.chapter_context.map((context) => {
      contexts.add(context)
    })
  })
  return contexts
}
/**
 * list all chapter contexts
 * for each chapter context, reduce all the keys that are present
 * if within a same chapter context, there is a key that is not present in all items,
 * add a property `optionalkeys` to the object
 * */

export function listChapterContextsAndKeys(
  doc: Record<string, any>
): Record<string, ChapterObject> {
  return doc.reduce((acc: Record<string, ChapterObject>, item: Record<string, any>) => {
    const chapter_context = item.chapter_context[0].trim()
    const contextObj = acc[chapter_context]
    if (!!contextObj) {
      findNonCommonKeys(Array.from(contextObj.keys), Object.keys(item)).forEach((nonCommonKey) => {
        contextObj.optionalKeys.add(nonCommonKey)
        contextObj.keys.delete(nonCommonKey)
      })
    } else {
      acc[chapter_context] = { keys: new Set(Object.keys(item)), optionalKeys: new Set<string>() }
    }
    return acc
  }, {})
}
type ChapterObject = {
  keys: Set<string>
  optionalKeys: Set<string>
}
/**
 * find keys common to all chapters
 */

export function findCommonKeys(doc: Record<ChapterContexts, ChapterObject>) {
  return Object.values(doc).reduce(
    (acc: KeyTypes, chapterObj) => {
      if (acc.commonKeys.size === 0) {
        chapterObj.keys.forEach((entry) => acc.commonKeys.add(entry))
        chapterObj.optionalKeys.forEach((entry) => acc.optionalKeys.add(entry))
        return acc
      } else {
        chapterObj.optionalKeys.forEach((opt_key) => acc.optionalKeys.add(opt_key))
        // filter out the keys that are not common between the two
        // add the filtered out keys to the optional keys
        // add the optional keys of the chapterObj to the optional keys
        findNonCommonKeys(Array.from(acc.commonKeys), Array.from(chapterObj.keys)).forEach(
          (nonCommonKey) => {
            acc.optionalKeys.add(nonCommonKey)
            acc.commonKeys.delete(nonCommonKey)
          }
        )
        return acc
      }
    },
    { commonKeys: new Set<string>(), optionalKeys: new Set<string>() }
  )
}

const findNonCommonKeys = (a: string[], b: string[]) =>
  a.filter((a_key) => !b.includes(a_key)).concat(b.filter((b_key) => !a.includes(b_key)))
