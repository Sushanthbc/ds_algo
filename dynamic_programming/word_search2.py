class TrieNode:
    def __init__(self, val):
        self.val = val
        self.word = None
        self.found = False
        self.leaf = False
        self.childs = []
    def add_child(self, node):
        child = self.find(node.val)
        if child != None:
            return child
        self.childs.append(node)
        return node
    def find(self, val):
        for child in self.childs:
            if child.val == val:
                return child
        return None

class Solution:
    diff = [[1,0],[-1,0],[0,-1],[0,1]]
    def buildTrie(self) -> None:
        self.head = TrieNode(None)
        level = None
        for word in self.words:
            level = self.head.add_child(TrieNode(word[0]))
            level.word = word[0]
            for j in range(1, len(word)):
                level = level.add_child(TrieNode(word[j]))
                level.word = word[:j+ 1]
            level.leaf = True
        return

    def dfs(self, i, j, node) -> bool:
        if len(node.childs) == 0:
            return True
        self.visited[i][j] = 1
        for deviation in self.diff:
            x = i + deviation[0]
            y = j + deviation[1]
            if x < self.m and x > -1 and y < self.n and y > -1:
                if self.visited[x][y] == 0:
                    child = node.find(self.board[x][y])
                    if child != None:
                        # print(self.visited, x ,y, self.board[x][y])
                        if (child.leaf == True or len(child.childs) == 0) and not child.found:
                            child.found = True
                            self.found.append(child.word)
                        self.dfs(x, y, child)
        # print(self.visited, i ,j)
        self.visited[i][j] = 0
        return False

    def findWords(self, board: List[List[str]], words: List[str]) -> List[str]:
        self.board = board
        self.m = len(board)
        self.n = len(board[0])
        self.words = words
        self.found = []
        self.buildTrie()
        self.visited = [[0 for i in range(self.n)] for j in range(self.m)]
        for i in range(self.m):
            for j in range(self.n):
                node = self.head.find(board[i][j])
                if node != None:
                    if (node.leaf == True or len(node.childs) == 0) and not node.found:
                        node.found = True
                        self.found.append(node.word)
                    self.dfs(i, j, node)
        return list(self.found)
