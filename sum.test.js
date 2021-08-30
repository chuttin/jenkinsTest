const { test, expect } = require('@jest/globals')
const sum = require('./sum')

test('expect 1 plus 2 equals 3', () => {
  expect(sum(1, 2)).toBe(3)
})