//
//  CVHA_EditorDocument.swift
//  CVHA Editor
//
//  Created by Steve Craig on 23/06/2023.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var exampleText: UTType {
        UTType(importedAs: "com.example.plain-text")
    }
}

struct CVHA_EditorDocument: FileDocument {
    var text: String

    init(text: String = """
---
layout: post.njk
title: Your Post Title
tags: ['Post']
description: Edit this to give a post description
featuredImage: /_images/cvha-badge-default.png
date: 2023-07-24
---

Edit the rest of this to put in what you want.

# Title H1
## Title H2
### Title H3
#### Title H4
##### Title H5
###### Title H6

## Paragraphs

Note: Bulma CSS is the main formatting engine for the site

Etiam ut risus sagittis, posuere mi at, congue dui. Sed in turpis ut felis bibendum blandit non sit amet ipsum. Etiam mattis metus sed felis cursus ultricies. Donec varius lectus maximus orci mattis sagittis.

Donec quis turpis eu justo suscipit eleifend in at mi. Nulla at lectus molestie, blandit elit eu, eleifend sem. Nunc suscipit tincidunt consectetur.

## Bold, cursive and link
**Bold**, _cursive_ and [link](https://www.11ty.dev/)

## Lists

- Donec quis turpis eu justo suscipit eleifend in at mi.
  - Nulla at lectus molestie, blandit elit eu, eleifend sem.
  - Nunc suscipit tincidunt consectetur.
- Integer et neque in purus pulvinar consequat vel quis arcu.
- Morbi porttitor blandit justo quis commodo.

1. Element 1
2. Element 2
3. Element 3
4. Element 4

## Images
![imagen](/_images/ClydeValleyHorseArchersMain.png)


## Table

| Item         | Price     | # In stock |
|--------------|-----------|------------|
| Juicy Apples | 1.99      | *7*        |
| Bananas      | **1.89**  | 5234       |

## Quotes

> Donec quis turpis eu justo suscipit eleifend in at mi. Nulla at lectus molestie, blandit elit eu, eleifend sem. Nunc suscipit tincidunt consectetur.

## Code

`console.log('Hello World')`

```
// tag <pre>
console.log('Hello World')
```
""") {
        self.text = text
    }

    static var readableContentTypes: [UTType] { [.exampleText] }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        text = string
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = text.data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
}
