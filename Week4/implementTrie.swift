class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord: Bool = false
}

class Trie {
    private var root: TrieNode
    init() {
        root = TrieNode()
    }

    func insert(_ word: String) {
        var node = root

        for char in word {
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            node = node.children[char]! // Move to the next node
        }

        node.isEndOfWord = true // this is the last node created at above.So we mark it as end of word.
    }

    func search(_ word: String) -> Bool {
        var node = root

        for char in word {
            guard let nextNode = node.children[char] else { return false }
            node = nextNode
        }

        return node.isEndOfWord
    }

    func startsWith(_ prefix: String) -> Bool {
        var node = root
        for char in prefix {
            guard let nextNode = node.children[char] else { return false }
            node = nextNode
        }
        return true
    }
}
