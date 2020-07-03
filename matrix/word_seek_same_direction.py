# Enter your code here. Read input from STDIN. Print output to STDOUT

class TrieNode:
    '''
        Trie data structure to avoid repetation of words
    '''
    def __init__(self, word):
        self.word = word
        self.childs = []
        self.found = False
        self.leaf = False

    def add_child(self, word):
        child = self.find(word[-1])
        if child != None:
            return child
        node = TrieNode(word)
        self.childs.append(node)
        return node

    def is_leaf(self):
        return self.leaf == True or len(self.childs) == 0

    def find(self, char):
        for child in self.childs:
            if child.word[-1] == char:
                return child
        return None


class WorkSeek:
    '''
        input: grid[m * n], words -> [string]
        operation: search word in staight line in grid
        output: {word: [position_1, position_2]}
    '''
    derivatives = [[-1,0], [1,0], [0, -1], [0, 1], [1,1], [-1,-1], [1,-1], [-1,1]]

    def __init__(self, grid, words):
        self.grid = grid
        self.words = words
        self.m = len(grid)
        self.n = len(grid[0])
        self.found = {word: ['-1', '-1'] for word in self.words}
        self.build_trie()

    def build_trie(self):
        self.head = TrieNode("")
        for word in self.words:
            var = word[:1]
            level = self.head.add_child(var)
            for i in range(2, len(word) + 1):
                level = level.add_child(word[:i])
            level.leaf = True

    #mark found word
    def found_word(self, node, i, j):
        if node.is_leaf() and not node.found:
            self.found[node.word] = [str(i), str(j)]
            node.found = True

    def dfs(self, i, j, start_i, start_j, node, last_direction):
        if node.is_leaf(): # edge case when only one node found
            self.found_word(node, start_i, start_j)
            return
        directions = self.derivatives # all direction search
        if last_direction != None: # for straight line search
            directions = [last_direction]
        for [dx, dy] in directions:
            x = i + dx
            y = j + dy
            if x < 0 or x >= self.m or y < 0 or y >= self.n:
                continue
            child = node.find(self.grid[x][y])
            if child != None:
                self.found_word(child, start_i, start_j)
                self.dfs(x, y, start_i, start_j, child, [dx, dy])
        return

    # loop through grid and perform dfs
    def search(self):
        for i in range(self.m):
            for j in range(self.n):
                node = self.head.find(self.grid[i][j])
                if node:
                    self.found_word(node, i, j)
                    self.dfs(i, j, i, j, node, None)
        return self.found

if __name__ == "__main__":
    grid = []
    val = input()
    while(val != ""):
        grid.append(list(val.strip()))
        val = input()
    strings = []
    val = input()
    while(val != ""):
        try:
            strings.append(val.strip())
            val = input()
        except EOFError:
            break
    word_seek = WorkSeek(grid, strings)
    result = word_seek.search()
    for key in result:
        print(key, ' '.join(result[key]))